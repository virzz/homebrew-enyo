class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.8/llmapi-darwin-arm64.tar.gz"
    sha256 "aaae583e1745c7266d36455f9c0eaeb9b98d74dbc04826dd9bf1f6d7222f9502"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.8/llmapi-darwin-amd64.tar.gz"
    sha256 "13a10e1e0b0b474e3ad15ba625f96d1a79b14cce62f8374c52b06f110253decf"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.8/llmapi-linux-amd64.tar.gz"
    sha256 "6b5fc3902508518d23cd55cf8a0f75d30c7aa9506cc2fce4dc499a3f8e61e1a9"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
