class Cli < Formula
  desc "a CLI to self-host ProjDocs"
  homepage "https://github.com/projdocs/cli"
  version "v0.0.4"

  on_macos do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.4/projdocs-v0.0.4-darwin-arm64"
      sha256 "7201cc91a25b64ddd904d508ec05b91c5744c67f252e62554fc69fa10765d68a"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.4/projdocs-v0.0.4-darwin-amd64"
      sha256 "64ee5bdb38224076d8069721df1506a8c98b61b298143811d7e156dc3e09bea2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.4/projdocs-v0.0.4-linux-arm64"
      sha256 "7630990ba7cffed6f949135c4599e19ffeee474af1d24839e1a1971006b7b6dc"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.4/projdocs-v0.0.4-linux-amd64"
      sha256 "2eff550e11cf95e6703026293cdd4b21f265ebf9b593be11466903f7207bb7a2"
    end
  end

  def install
    bin.install Dir["projdocs-*"][0] => "projdocs"
  end

  test do
    system "#{bin}/projdocs", "--version"
  end
end