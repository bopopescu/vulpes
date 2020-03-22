.PHONY: lint

lint:
	@if [ -z `which golangci-lint 2> /dev/null` ]; then \
		GO111MODULE=on go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.17.1; \
	fi
	@golangci-lint run --tests \
		-D typecheck \
		-E dupl \
		-E goconst \
		-E gofmt \
		-E goimports \
		-E gosec \
		-E misspell \
		-E stylecheck \
		-E unparam

test:
	go test -race -v ./...

build:
	DOCKER_BUILDKIT=1 docker build -t vulpes .