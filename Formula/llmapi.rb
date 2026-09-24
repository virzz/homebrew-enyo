class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v#{version}/llmapi-darwin-arm64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v#{version}/llmapi-darwin-amd64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v#{version}/llmapi-linux-amd64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
