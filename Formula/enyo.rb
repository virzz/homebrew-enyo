class Enyo < Formula
  desc "Cyber Swiss Army Knife for terminal"
  homepage "https://github.com/virzz/enyo-rs"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/virzz/enyo-rs/releases/download/v#{version}/enyo-darwin-aarch64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/virzz/enyo-rs/releases/download/v#{version}/enyo-linux-aarch64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/virzz/enyo-rs/releases/download/v#{version}/enyo-linux-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
