class Enyo < Formula
  desc "Cyber Swiss Army Knife for terminal"
  homepage "https://github.com/virzz/enyo-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/virzz/enyo-rs/releases/download/v0.1.3/enyo-darwin-arm64.tar.gz"
    sha256 "1d4d2981950cc59e3b500681f484eeec339fdf920ae053111d5e0289ccd08c58"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/virzz/enyo-rs/releases/download/v0.1.3/enyo-darwin-amd64.tar.gz"
    sha256 "eb416239aefd7118b2fa1cd191f6f52be18554a6f37f1bd901562419ab16b86b"
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/virzz/enyo-rs/releases/download/v0.1.3/enyo-linux-amd64.tar.gz"
    sha256 "8172d4d198d76ef0506afff5a4b388d4e506d5f9b6643b649ec02fdbc24fa52f"
  end

  def install
    bin.install "enyo"

    generate_completions_from_executable(bin/"enyo", "completion")
  end

  test do
    assert_match "enyo", shell_output("#{bin}/enyo --version")
  end
end
