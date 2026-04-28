package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"runtime"
	"strings"

	"github.com/projdocs/homebrew-taps/pkg/packages"
	"github.com/projdocs/homebrew-taps/pkg/templates"
	"github.com/projdocs/homebrew-taps/pkg/types"
)

var taps = []*types.Package{
	&packages.CLI,
}

func main() {

	// get output directory
	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)
	distDir := filepath.Join(dir, "Formula")
	if err := os.MkdirAll(distDir, 0755); err != nil {
		log.Fatalf("Error creating dist directory: %s", err)
	}

	for _, tap := range taps {
		if releases, err := tap.DownloadReleases(); err != nil {
			fmt.Printf("Error downloading releases: %s\n", err.Error())
			os.Exit(1)
		} else {
			for _, release := range releases {
				log.Println(fmt.Sprintf("Downloading %s", *release.TagName))
				if formula, err := templates.NewFormulaData(tap, release); err != nil {
					log.Fatalln(fmt.Sprintf("Error generating formula for %s (%s): %s", tap.Name, *release.TagName, err.Error()))
				} else if formulaFile, err := formula.Render(); err != nil {
					log.Fatalln(fmt.Sprintf("Error generating formula file for %s (%s): %s ", tap.Name, *release.TagName, err.Error()))
				} else {
					filename := filepath.Join(distDir, fmt.Sprintf("%s@%s.rb", strings.ToLower(tap.Name), *release.TagName))
					if err := os.WriteFile(filename, []byte(formulaFile), 0644); err != nil {
						log.Fatalf("Error writing formula file %s: %s", filename, err)
					}

					log.Printf("Wrote %s", filename)
				}
			}
		}
	}
}
