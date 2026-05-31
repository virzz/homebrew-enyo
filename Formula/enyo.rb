class Enyo < Formula
  desc "Cyber Swiss Army Knife for terminal"
  homepage "https://github.com/virzz/enyo-rs"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/virzz/enyo-rs/releases/download/v#{version}/enyo-darwin-aarch64.tar.gz"
    sha256 "f4e85554bc71a0ddc55368034c877b80ddf88dea959abb083a3a0871db3e6c21"
  end

  on_linux do
    on_arm do
      url "https://github.com/virzz/enyo-rs/releases/download/v#{version}/enyo-linux-aarch64.tar.gz"
      sha256 "689ec1e6d8746e29729e2a60e77c798c25ada39856abba82fbff8d76c0661600"
    end
    on_intel do
      url "https://github.com/virzz/enyo-rs/releases/download/v#{version}/enyo-linux-x86_64.tar.gz"
      sha256 "91868f93fd8aa9664d01e4f204d846e40e79bc121ecef010161838c800a331dc"
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
