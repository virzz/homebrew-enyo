class Superx < Formula
  desc "Setuid root shell launcher with platform authentication support"
  homepage "https://github.com/virzz/superx"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/superx/releases/download/v0.1.1/superx-darwin-arm64.tar.gz"
    sha256 "6ff476ae11bd03390cc4bc8f59022e57e920c572b663ca3bc2436755353a9c96"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/superx/releases/download/v0.1.1/superx-darwin-amd64.tar.gz"
    sha256 "36fd72564f515e5462610808aacad5e238f18b122cbc70f31d8827b97f01530c"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/superx/releases/download/v0.1.1/superx-linux-amd64.tar.gz"
    sha256 "3d8db8050bd7b5e05e77c039634af146094b5df9fcba9498b51c0afedad7099d"
  end

  def install
    bin.install "superx"
  end

  test do
    assert_path_exists bin/"superx"
  end
end
