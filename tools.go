//go:build tools

// https://github.com/golang/go/issues/25922#issuecomment-1038394599
package main

/*
CAUTION:
GitHub Actions processes this file to automatically maintain Go module versions.
The only edits that should be made to this file are to add or remove tools from the import block.

Each import should have a companion 'go install ...' command in the Dockerfile.
*/

import (
	_ "github.com/cloudflare/pint/cmd/pint"
	_ "github.com/google/go-jsonnet/cmd/jsonnet"
	_ "github.com/google/go-jsonnet/cmd/jsonnet-lint"
	_ "github.com/google/go-jsonnet/cmd/jsonnetfmt"
	_ "github.com/grafana/dashboard-linter"
	_ "github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb"
	_ "github.com/monitoring-mixins/mixtool/cmd/mixtool"
	_ "github.com/prometheus/prometheus/cmd/promtool"
)
