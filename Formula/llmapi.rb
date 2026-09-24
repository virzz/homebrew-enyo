class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.2/llmapi-darwin-arm64.tar.gz"
    sha256 "bc526208c12c73406326e6d802fedfa6834d4197fb5f5173ec70e7fcaa05e7cf"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.2/llmapi-darwin-amd64.tar.gz"
    sha256 "5d929f99fdededbd1ae4fecb9ff7809ee42ff96434793db1c452ea5f1b2a830d"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.2/llmapi-linux-amd64.tar.gz"
    sha256 "3443871bc4d1e25b49e9bc991e72243711e10501cef739b4815edd772dc78f03"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
