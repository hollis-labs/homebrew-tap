# typed: false
# frozen_string_literal: true

class Cerberus < Formula
  desc "Agent-first local infrastructure manager"
  homepage "https://github.com/hollis-labs/cerberus"
  version "0.5.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hollis-labs/cerberus/releases/download/v0.5.0-beta.1/cerberus_0.5.0-beta.1_darwin_arm64.tar.gz"
      sha256 "4b07f49b942e74df75cc4de3a3044b3c4279986ca968ea2d16a0d1790056e676"
    else
      url "https://github.com/hollis-labs/cerberus/releases/download/v0.5.0-beta.1/cerberus_0.5.0-beta.1_darwin_amd64.tar.gz"
      sha256 "456db335e3e22a06efbc78ddf6d33b1ceafb706e3049664962c6bc2bcfd3358c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hollis-labs/cerberus/releases/download/v0.5.0-beta.1/cerberus_0.5.0-beta.1_linux_arm64.tar.gz"
      sha256 "b498b6c4aad6ccd037097b4e48b59c6165bc6794eccefcd82b4f123650ab3d0e"
    else
      url "https://github.com/hollis-labs/cerberus/releases/download/v0.5.0-beta.1/cerberus_0.5.0-beta.1_linux_amd64.tar.gz"
      sha256 "19c551bea1624f23522ed5e85b7c2bf735d1e029780f428f51dd9c4c559e18ca"
    end
  end

  def install
    # cerberus-presence sits next to cerberus, where the daemon looks for it:
    # without it, enrolling a passkey is refused.
    bin.install "cerberus", "cerberus-presence"
    doc.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cerberus --version")
    assert_predicate bin/"cerberus-presence", :executable?
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
