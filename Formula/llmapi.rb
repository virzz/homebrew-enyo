class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.6/llmapi-darwin-arm64.tar.gz"
    sha256 "761988f6a9d70452b6e1c56d88cd114ff68e61ed1dae4e5dd1cd296fc6bf0689"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.6/llmapi-darwin-amd64.tar.gz"
    sha256 "ae26951bfdacbe5d359c2e37c3bd48e26b53836ad600d501216c40258d262494"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.6/llmapi-linux-amd64.tar.gz"
    sha256 "42ae62503be638560ed561b892c3a1342943964f963e9a7608e9edcbca1f9ea1"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
