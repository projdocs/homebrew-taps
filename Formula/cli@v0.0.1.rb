class CLI < Formula
  desc "a CLI to self-host ProjDocs"
  homepage "https://github.com/projdocs/cli"
  version "v0.0.1"

  on_macos do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.1/projdocs-v0.0.1-darwin-arm64"
      sha256 "sha256:083bd687463cb0851e123b5505643b2ad9079eb15dbb404fe735171f1fbeb8bd"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.1/projdocs-v0.0.1-darwin-amd64"
      sha256 "sha256:8c29db0b0fb4d7b8ddb0c0fca619675aa86465ddf02f6329efb548f9b4ca7040"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.1/projdocs-v0.0.1-linux-arm64"
      sha256 "sha256:a787368d550e2f7efbbfabd55f0571411f4faa78f2a6d78a2f3eed7b8b63d258"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.1/projdocs-v0.0.1-linux-amd64"
      sha256 "sha256:18a3015daccc1d63e3369ae0c2702043c297c28b3d3c2a20142c907aee1da054"
    end
  end

  def install
    bin.install Dir["projdocs-*"][0] => "projdocs"
  end

  test do
    system "#{bin}/projdocs", "--version"
  end
end