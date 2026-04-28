package templates

import (
	"bytes"
	"fmt"
	"strings"
	"text/template"

	"github.com/google/go-github/v85/github"
	"github.com/projdocs/homebrew-taps/pkg/types"
)

type Asset struct {
	URL    string
	SHA256 string
}

type Assets struct {
	DarwinArm64 Asset
	DarwinAmd64 Asset
	LinuxArm64  Asset
	LinuxAmd64  Asset
}

type FormulaData struct {
	Name         string
	BinaryPrefix string
	Desc         string
	Homepage     string
	Version      string
	Assets       Assets
}

func NewFormulaData(p *types.Package, r *github.RepositoryRelease) (*FormulaData, error) {

	assets := Assets{}
	for _, a := range r.Assets {
		url := a.GetBrowserDownloadURL()
		name := a.GetName()

		var target *Asset
		switch {
		case strings.Contains(name, "darwin-arm64"):
			target = &assets.DarwinArm64
		case strings.Contains(name, "darwin-amd64"):
			target = &assets.DarwinAmd64
		case strings.Contains(name, "linux-arm64"):
			target = &assets.LinuxArm64
		case strings.Contains(name, "linux-amd64"):
			target = &assets.LinuxAmd64
		default:
			continue
		}
		target.SHA256 = *a.Digest
		target.URL = url
	}

	return &FormulaData{
		Name:         strings.ToUpper(p.Name[0:1]) + strings.ToLower(p.Name[1:]),
		BinaryPrefix: p.Binary,
		Desc:         p.Desc,
		Homepage:     fmt.Sprintf("https://github.com/%s/%s", p.Repo.Owner, p.Repo.Name),
		Version:      *r.TagName,
		Assets:       assets,
	}, nil
}

func (formula *FormulaData) Render() (string, error) {
	tmpl := template.Must(template.New("formula").Parse(formulaTemplate))
	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, formula); err != nil {
		return "", err
	}
	return buf.String(), nil
}
