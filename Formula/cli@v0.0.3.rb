class Cli < Formula
  desc "a CLI to self-host ProjDocs"
  homepage "https://github.com/projdocs/cli"
  version "v0.0.3"

  on_macos do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.3/projdocs-v0.0.3-darwin-arm64"
      sha256 "23a62599471884c5ffa3225cf87271c3bed272187a0e0a5e0944f53b46c79c9c"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.3/projdocs-v0.0.3-darwin-amd64"
      sha256 "e6c4525f36c514a6ee108948dbf0e42d4b785722045124834484d4d5091e6f57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/projdocs/cli/releases/download/v0.0.3/projdocs-v0.0.3-linux-arm64"
      sha256 "9f311ce086f913534de65ac520aa03cc1b3706979db4e7335438e4473ce69250"
    end
    on_intel do
      url "https://github.com/projdocs/cli/releases/download/v0.0.3/projdocs-v0.0.3-linux-amd64"
      sha256 "ebda495d18049234d184cf88c6f201f1b452b66d64b29971ad704ea64e69b871"
    end
  end

  def install
    bin.install Dir["projdocs-*"][0] => "projdocs"
  end

  test do
    system "#{bin}/projdocs", "--version"
  end
end