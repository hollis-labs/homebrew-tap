# typed: false
# frozen_string_literal: true

class Nanite < Formula
  desc "Local-first agent runtime: chat, workflows, MCP tools and durable Tether actors"
  homepage "https://github.com/hollis-labs/nanite"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Release tarballs are built for macOS only. On Linux, install from the CI
  # build artifacts with fleet-install (see the Nanite README).
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hollis-labs/nanite/releases/download/v0.4.0/nanite_v0.4.0_darwin_arm64.tar.gz"
      sha256 "5f950d7f6c345ace3b9ba202d5cce9deab387c10b30a81b5134779c278a9682c"
    else
      url "https://github.com/hollis-labs/nanite/releases/download/v0.4.0/nanite_v0.4.0_darwin_amd64.tar.gz"
      sha256 "63c3fe990a4e0ffce48504c0ad11fe42347bea93a4f830878741e0ad774b1254"
    end
  end

  def install
    bin.install "nanite"
    doc.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nanite version")
  end
end
