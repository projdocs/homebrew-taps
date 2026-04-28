package packages

import "github.com/projdocs/homebrew-taps/pkg/types"

var CLI = types.Package{
	Name:   "cli",
	Binary: "projdocs",
	Desc:   "a CLI to self-host ProjDocs",
	Repo: types.Repo{
		Owner: "projdocs",
		Name:  "cli",
	},
}
