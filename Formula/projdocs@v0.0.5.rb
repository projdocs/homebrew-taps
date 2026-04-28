class projdocs < Formula
  desc "a CLI to self-host ProjDocs"
  homepage "https://github.com/projdocs/cli"
  version "v0.0.5"

  on_macos do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.5/projdocs-v0.0.5-darwin-arm64"
      sha256 "sha256:ed017d8081973046df250411e63a00a6e1099a90ab101725617a1371aff221c1"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.5/projdocs-v0.0.5-darwin-amd64"
      sha256 "sha256:727cccdff5f06f0e9ab8ef088ab76149d3ea49367664733b2530d80b1f3f878c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.5/projdocs-v0.0.5-linux-arm64"
      sha256 "sha256:78b58563b2e5f4b3d6ff51b63980f6b56a58a11afdab451691d269c01a77dea0"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.5/projdocs-v0.0.5-linux-amd64"
      sha256 "sha256:bd69859c10261586a359b5280105a01a2bf5812c8002ecfd25aaac72d27866f3"
    end
  end

  def install
    bin.install Dir["projdocs-*"][0] => "projdocs"
  end

  test do
    system "#{bin}/projdocs", "--version"
  end
end