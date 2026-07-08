# typed: false
# frozen_string_literal: true

# br (beads_rust) — agent-first issue tracker with SQLite + JSONL sync.
#
# Hosted here in boshu2/homebrew-agentops, pinned to the latest upstream release,
# because the upstream dicklesworthstone/tap formula lags (0.2.10 as of 2026-07-08,
# behind releases up to v0.2.16). AgentOps recommends br; keeping the formula in
# our own tap lets `brew upgrade` track the real latest. Bump `version` + the four
# sha256s from https://github.com/Dicklesworthstone/beads_rust/releases on each new
# release (digests are on each asset in the GitHub release JSON).
class Br < Formula
  desc "Agent-first issue tracker with SQLite + JSONL sync (beads_rust)"
  homepage "https://github.com/Dicklesworthstone/beads_rust"
  version "0.2.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dicklesworthstone/beads_rust/releases/download/v#{version}/br-#{version}-darwin_arm64.tar.gz"
      sha256 "43c2d38e8e550737e15e35e8eb1d804e726b85842ea02dc8ff02c3c50d4c2b81"
    end
    on_intel do
      url "https://github.com/Dicklesworthstone/beads_rust/releases/download/v#{version}/br-#{version}-darwin_amd64.tar.gz"
      sha256 "b154ebf279dccc8d671e69ddce0fa7cdee4ea72144a0cd4209a7afe044c54219"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dicklesworthstone/beads_rust/releases/download/v#{version}/br-#{version}-linux_amd64.tar.gz"
      sha256 "9ee22d340b56dacfb20460d8e4b2a0065fb66f161910472285d55f51e04512b0"
    end
    on_arm do
      url "https://github.com/Dicklesworthstone/beads_rust/releases/download/v#{version}/br-#{version}-linux_arm64.tar.gz"
      sha256 "84b5dc30d583eafc00e617473e83a38172f3f8143db3a95c007eb242ae80cc51"
    end
  end

  def install
    bin.install "br"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/br --version")
  end
end
