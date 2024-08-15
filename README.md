# Telembox - Telemetry Toolbox for Mixin Development

## What's in the Box?
- [`dashboard-linter`](https://github.com/grafana/dashboard-linter/blob/main/docs/index.md)
- [`jb`](https://github.com/jsonnet-bundler/jsonnet-bundler)
- [`jsonnet`](https://github.com/google/go-jsonnet/tree/master/cmd)
- [`jsonnet-lint`](https://github.com/google/go-jsonnet/tree/master/cmd)
- [`jsonnetfmt`](https://github.com/google/go-jsonnet/tree/master/cmd)
- [`mixtool`](https://github.com/monitoring-mixins/mixtool/tree/main)
- [`pint`](https://cloudflare.github.io/pint/)
- [`promtool`](https://github.com/prometheus/prometheus/tree/main/cmd/promtool)

## Usage

```sh
# the entrypoint is simply a bash shell with the utilities available
docker run --rm -ti --name telemetry-dev -v "<project-path>":/workspace docker pull ghcr.io/joshrooz/telembox:latest

# testing
jb install
jsonnetfmt --test main.libsonnet ; echo $?   # jsonnetfmt --in-place main.jsonnet
jsonnet-lint --jpath vendor main.libsonnet
jsonnet --jpath vendor main.libsonnet -o dashboards/dashboard.json
```

## Adding a Go-based Utility
A Go module is used to enable low-touch package updates with Dependabot.

1. Add the new program to `tools.go`.
1. Update the `Dockerfile`.
1. Add to the ["What's in the Box"](#whats-in-the-box) list in the `README`.

## References and Resources
- https://jsonnet.org/
- https://github.com/databricks/jsonnet-style-guide
