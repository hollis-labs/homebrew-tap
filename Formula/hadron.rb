# typed: false
# frozen_string_literal: true

class Hadron < Formula
  desc "Local-first, agent-first blueprint automation runner"
  homepage "https://github.com/hollis-labs/hadron"
  version "0.4.2-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hollis-labs/hadron/releases/download/v0.4.2-beta.1/hadron_v0.4.2-beta.1_darwin_arm64.tar.gz"
      sha256 "c7cca913eb8f5c4185ce0dbed8fcbb2dbc299f9d6073940cfcc8d11f779eb4bb"
    else
      url "https://github.com/hollis-labs/hadron/releases/download/v0.4.2-beta.1/hadron_v0.4.2-beta.1_darwin_amd64.tar.gz"
      sha256 "693efe09da2288e3e3a0cb1cba24ad6392ab062fb7ae85e142b785750cb1f516"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hollis-labs/hadron/releases/download/v0.4.2-beta.1/hadron_v0.4.2-beta.1_linux_arm64.tar.gz"
      sha256 "b75021662a421300d3afcef1f543c401651b66e080bba1eb85dc02db289e0385"
    else
      url "https://github.com/hollis-labs/hadron/releases/download/v0.4.2-beta.1/hadron_v0.4.2-beta.1_linux_amd64.tar.gz"
      sha256 "577f007bfe99f2172d85461b44a4c409afbf80369e2cf196ddd2cf991fa4b8f7"
    end
  end

  def install
    bin.install "hadron", "hadrond"
    doc.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hadron version")
    assert_match version.to_s, shell_output("#{bin}/hadrond version")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
