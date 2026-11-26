class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.9/llmapi-darwin-arm64.tar.gz"
    sha256 "9cc841668158eaffca141308fcede7e660f48f2595d0168cc5daff274a336132"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.9/llmapi-darwin-amd64.tar.gz"
    sha256 "0f44c353a394d651679ea01c4ff01b530223f3a17019dca5ffb838e56cab5ff0"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.9/llmapi-linux-amd64.tar.gz"
    sha256 "ad9deebc18f86208ec654cfa0a229db8507a499e9e6e9d85b82b8b9c97b82cd2"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
