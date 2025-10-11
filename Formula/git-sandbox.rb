# typed: false
# frozen_string_literal: true

class GitSandbox < Formula
  desc "Safe throwaway git worktrees for experiments"
  homepage "https://github.com/hollis-labs/git-sandbox"
  version "1.3.1"

  # Point to your release asset (uploaded script)
  url "https://github.com/hollis-labs/git-sandbox/releases/download/v1.3.1/git-sandbox"
  sha256 "bee7915037ea7cc3f35cdbc4486f972850474c6b61f24d516e0b63f280112a18"
  license :public_domain

  def install
    bin.install "git-sandbox"
  end

  test do
    system "#{bin}/git-sandbox", "-v"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end

