class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.5/llmapi-darwin-arm64.tar.gz"
    sha256 "c17579a1ce085ac9b97df4edaa4d032384dc3718443981a50abbbfb0b842a98b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.5/llmapi-darwin-amd64.tar.gz"
    sha256 "10e55ca4fc0a7371f4c4de5364c44915758e633439de84e86d7f90a4e8eec40d"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.5/llmapi-linux-amd64.tar.gz"
    sha256 "631eece53826a6c1b75be68dd4797509bd306a722a7e4440c92bc613995cfd17"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
