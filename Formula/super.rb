class Super < Formula
  desc "Setuid root shell launcher with platform authentication support"
  homepage "https://github.com/virzz/superx"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/superx/releases/download/v0.1.0/superx-darwin-arm64.tar.gz"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/superx/releases/download/v0.1.0/superx-darwin-amd64.tar.gz"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/superx/releases/download/v0.1.0/superx-linux-amd64.tar.gz"
  end

  def install
    bin.install "superx"
  end

  test do
    assert_predicate bin/"superx", :exist?
  end
end
