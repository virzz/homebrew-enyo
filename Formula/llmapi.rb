class Llmapi < Formula
  desc "Multi-provider LLM API protocol conversion proxy"
  homepage "https://github.com/virzz/llmapi-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.4/llmapi-darwin-arm64.tar.gz"
    sha256 "cd6460ca1de634d2804f2511919dbbdad7d184a611218f993c4bed856b9fe330"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.4/llmapi-darwin-amd64.tar.gz"
    sha256 "b06a6315644ac2e982ded7f250edb76b0e56e8af446b78d5aacf4da3580a3023"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/llmapi-rs/releases/download/v0.1.4/llmapi-linux-amd64.tar.gz"
    sha256 "862340c54d2ec9e57d1cf009d6f6981631de125896d60d5dcbaa797c0e5649dc"
  end

  def install
    bin.install "llmapi"
  end

  test do
    assert_match "Start the HTTP server", shell_output("#{bin}/llmapi --help")
  end
end
