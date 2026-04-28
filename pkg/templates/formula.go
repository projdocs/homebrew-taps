package templates

const formulaTemplate = `class {{.Name}} < Formula
  desc "{{.Desc}}"
  homepage "{{.Homepage}}"
  version "{{.Version}}"

  on_macos do
    on_arm do
      url "{{.Assets.DarwinArm64.URL}}"
      sha256 "{{.Assets.DarwinArm64.SHA256}}"
    end
    on_intel do
      url "{{.Assets.DarwinAmd64.URL}}"
      sha256 "{{.Assets.DarwinAmd64.SHA256}}"
    end
  end

  on_linux do
    on_arm do
      url "{{.Assets.LinuxArm64.URL}}"
      sha256 "{{.Assets.LinuxArm64.SHA256}}"
    end
    on_intel do
      url "{{.Assets.LinuxAmd64.URL}}"
      sha256 "{{.Assets.LinuxAmd64.SHA256}}"
    end
  end

  def install
    bin.install Dir["{{.BinaryPrefix}}-*"][0] => "{{.BinaryPrefix}}"
  end

  test do
    system "#{bin}/{{.BinaryPrefix}}", "--version"
  end
end`
