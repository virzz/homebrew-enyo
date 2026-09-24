class Enyo < Formula
  desc "Cyber Swiss Army Knife for terminal"
  homepage "https://github.com/virzz/enyo-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/virzz/enyo-rs/releases/download/v0.1.3/enyo-darwin-arm64.tar.gz"
      sha256 "1d4d2981950cc59e3b500681f484eeec339fdf920ae053111d5e0289ccd08c58"
    end

    on_intel do
      url "https://github.com/virzz/enyo-rs/releases/download/v0.1.3/enyo-darwin-amd64.tar.gz"
      sha256 "eb416239aefd7118b2fa1cd191f6f52be18554a6f37f1bd901562419ab16b86b"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_arm do
      disable! "only x86_64 Linux binaries are published"
    end

    on_intel do
      url "https://github.com/virzz/enyo-rs/releases/download/v0.1.3/enyo-linux-amd64.tar.gz"
      sha256 "8172d4d198d76ef0506afff5a4b388d4e506d5f9b6643b649ec02fdbc24fa52f"
    end
  end

  def install
    bin.install "enyo"

    bash_completion.install "completions/enyo.bash" => "enyo" if File.exist?("completions/enyo.bash")
    zsh_completion.install "completions/enyo.zsh" => "_enyo" if File.exist?("completions/enyo.zsh")
    fish_completion.install "completions/enyo.fish" if File.exist?("completions/enyo.fish")
  end

  test do
    assert_match "enyo", shell_output("#{bin}/enyo --version")
  end
end
