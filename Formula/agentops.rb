class Agentops < Formula
  desc "Knowledge Flywheel CLI for AI-assisted development"
  homepage "https://github.com/boshu2/agentops"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/boshu2/agentops/releases/download/v#{version}/ao-darwin-arm64.tar.gz"
      sha256 "fe7ea522817beeb38678cf2c393b8885d3366b679da7bdc91a163a0f9efa69bd"
    end
    on_intel do
      url "https://github.com/boshu2/agentops/releases/download/v#{version}/ao-darwin-amd64.tar.gz"
      sha256 "6f6f01701ba99e3164f3b3d2c6cc97da1ef6e0682d4ac1f127a18a4050802a19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boshu2/agentops/releases/download/v#{version}/ao-linux-arm64.tar.gz"
      sha256 "a80f04270b821881303fb8b2186e20570fcec778ab533e93d5ba6d82351e9b73"
    end
    on_intel do
      url "https://github.com/boshu2/agentops/releases/download/v#{version}/ao-linux-amd64.tar.gz"
      sha256 "8231c8d315480e1928ffad6880f1316729d6a79f08e6b51b4f8b8b45e60c45c6"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ao-darwin-arm64" => "ao"
      else
        bin.install "ao-darwin-amd64" => "ao"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "ao-linux-arm64" => "ao"
      else
        bin.install "ao-linux-amd64" => "ao"
      end
    end
  end

  test do
    assert_match "ao version v#{version}", shell_output("#{bin}/ao version")
  end
end
