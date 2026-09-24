class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.1/llmapi-darwin-arm64.tar.gz"
    sha256 "9d32f23acf2e16c65e50119f9d1aaecbdcb2f7662432f5b63a8481d3e84bbca5"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.1/llmapi-darwin-amd64.tar.gz"
    sha256 "de4b6ac8ae1b4c2c762f37eb2399557274ce7814fa14c97867bafe573c0dfe9c"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.1/llmapi-linux-amd64.tar.gz"
    sha256 "2bcc47915aca50be6fd655ee5e3449f619da5481110d193a2c9dc6e5542872fb"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
