class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.7/llmapi-darwin-arm64.tar.gz"
    sha256 "2f7beecfc6a453b2d84776b17340b292d78c2145311054f475a66575725bda45"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.7/llmapi-darwin-amd64.tar.gz"
    sha256 "9ad8009b7c524ff69022bd31c71c2cb1f5dc8dc431ef1b4f3c41c9c408f14be0"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.7/llmapi-linux-amd64.tar.gz"
    sha256 "b3a096762236b1589c5243c1707c0e9f30f1abe79028c6c2fb9e178925c603d5"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
