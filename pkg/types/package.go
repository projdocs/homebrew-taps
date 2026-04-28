package types

import (
	"context"

	"github.com/google/go-github/v85/github"
)

type Repo struct {
	Owner string
	Name  string
}

type Package struct {
	Name   string
	Binary string
	Repo   Repo
	Desc   string
}

func (p *Package) DownloadReleases() ([]*github.RepositoryRelease, error) {

	client := github.NewClient(nil)

	var all []*github.RepositoryRelease
	opts := &github.ListOptions{PerPage: 100}

	for {
		releases, resp, err := client.Repositories.ListReleases(context.Background(), p.Repo.Owner, p.Repo.Name, opts)
		if err != nil {
			return nil, err
		}
		all = append(all, releases...)
		if resp.NextPage == 0 {
			break
		}
		opts.Page = resp.NextPage
	}

	return all, nil
}
