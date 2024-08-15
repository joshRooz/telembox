# syntax=docker/dockerfile:1
FROM golang:1.23 AS go-tools
WORKDIR /go/src/telembox
COPY go.mod go.sum .
RUN \
      go install github.com/cloudflare/pint/cmd/pint \
  &&  go install github.com/google/go-jsonnet/cmd/jsonnet \
  &&  go install github.com/google/go-jsonnet/cmd/jsonnet-lint \
  &&  go install github.com/google/go-jsonnet/cmd/jsonnetfmt \
  &&  go install github.com/grafana/dashboard-linter \
  &&  go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb \
  &&  go install github.com/monitoring-mixins/mixtool/cmd/mixtool \
  &&  go install github.com/prometheus/prometheus/cmd/promtool


FROM ubuntu:noble AS dev
RUN apt-get update \
  && apt-get install -y bash git jq vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY --from=go-tools /go/bin/* /bin
WORKDIR /workspace
ENTRYPOINT ["/bin/bash"]