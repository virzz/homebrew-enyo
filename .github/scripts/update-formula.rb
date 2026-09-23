require "digest"

name = ENV.fetch("FORMULA")
version = ENV.fetch("VERSION").delete_prefix("v")

abort "Invalid formula" unless name.match?(/\A[a-z0-9-]+\z/)
abort "Invalid version" unless version.match?(/\A\d+\.\d+\.\d+\z/)

path = "Formula/#{name}.rb"
formula = File.read(path)
homepages = formula.scan(/^  homepage "https:\/\/github\.com\/([a-z0-9-]+\/[a-z0-9-]+)"$/i).flatten
abort "Expected one GitHub homepage" unless homepages.length == 1

repository = homepages.first
if ARGV.fetch(0) == "resolve"
  puts "formula=#{name}"
  puts "repository=#{repository}"
  puts "version=#{version}"
  exit
end

abort "Unknown command" unless ARGV[0] == "render"
abort "Repository mismatch" unless ENV.fetch("REPOSITORY") == repository

version_pattern = /version "[^"]+"/
abort "Expected one version" unless formula.scan(version_pattern).length == 1

formula.sub!(version_pattern, %(version "#{version}"))

%w[darwin-arm64 darwin-amd64 linux-amd64].each do |platform|
  archive = "assets/#{name}-#{platform}.tar.gz"
  digest = Digest::SHA256.file(archive).hexdigest
  url = "https://github.com/#{repository}/releases/download/v\#{version}/#{name}-#{platform}.tar.gz"
  pattern = /(url "#{Regexp.escape(url)}"\s+sha256 ")[0-9a-f]{64}(")/
  abort "Expected one checksum for #{platform}" unless formula.scan(pattern).length == 1

  formula.sub!(pattern) { "#{$1}#{digest}#{$2}" }
end

File.write(path, formula)
