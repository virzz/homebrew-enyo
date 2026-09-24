class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.3/llmapi-darwin-arm64.tar.gz"
    sha256 "b41cc814a71f4ba62d0bffefc86947cf936acf3585b57ad38fe7d652f44745fe"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.3/llmapi-darwin-amd64.tar.gz"
    sha256 "4634d3582c381689e015611d5f18a488b2f60d14b7eb5db907ec1e6de9fbb711"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.3/llmapi-linux-amd64.tar.gz"
    sha256 "b525b9e10ce045a4518245bf263de1311091ba8766ef77896b6d8f237167b306"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
