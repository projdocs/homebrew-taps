class Cli < Formula
  desc "a CLI to self-host ProjDocs"
  homepage "https://github.com/projdocs/cli"
  version "v0.0.2"

  on_macos do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.2/projdocs-v0.0.2-darwin-arm64"
      sha256 "sha256:9d9585f3990ad1ac09fcd55358c6df4a416ec2f8c8f142d84aa08bf6da06c567"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.2/projdocs-v0.0.2-darwin-amd64"
      sha256 "sha256:fb196d8d0ebd7dc6ac798686b3f853a92d629b1f497c88de3a2ca0da59942b4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.2/projdocs-v0.0.2-linux-arm64"
      sha256 "sha256:eeeeccb44cd7e2890b33b673a47622c6da645bc9a4545e77a0059e8ae8e7714c"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.2/projdocs-v0.0.2-linux-amd64"
      sha256 "sha256:04d09832d9f5a6341b625f7b0343b0bf9241c59768dfd8967093aad79da5c052"
    end
  end

  def install
    bin.install Dir["projdocs-*"][0] => "projdocs"
  end

  test do
    system "#{bin}/projdocs", "--version"
  end
end