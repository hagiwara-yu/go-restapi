BINARY := api
MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PATH := $(PATH):${MAKEFILE_DIR}bin
SHELL := env PATH="$(PATH)" /bin/bash

GOARCH = amd64

build:
	mkdir -p build
	CGO_ENABLED=0 go build -o build/${BINARY} ./cmd/api

build-linux:
	mkdir -p build
	CGO_ENABLED=0 GOOS=linux GOARCH=${GOARCH} go build -o build/${BINARY}-linux-${GOARCH} ./cmd/api

mod:
	go mod download

test:
	go test $(shell go list ${MAKEFILE_DIR}/...)

lint:
	if ! [ -x $(GOPATH)/bin/golangci-lint ]; then \
		curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.45.2; \
	fi
	golangci-lint run --concurrency 2

vet:
	go vet ./...

.PHONY: build mod test lint vet clean

run:
	go run ./cmd/api