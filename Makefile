PROJECT ?= user-details
IMAGE ?= user-microservice
VERSION ?= $(shell date +v%Y%m%d)-$(shell git describe --tags --always --dirty)


all: test build

# Run lint
lint: generate # TODO: Removed 'manifests' for now, controller-tool will need the CRDs in v1alpha1 (version) package not in individual, need to find other way
	golangci-lint run ./pkg/... ./cmd/...

# Run tests
test:
	go test -v ./pkg/... ./cmd/... -coverprofile coverage.out

test-coverage:
	go tool cover -func=coverage.out

# Run against the configured Kubernetes cluster in ~/.kube/config
run:
	go run ./cmd/server/main.go

# Note: The build directory is the root of the k8s-test-infra repository, not ./
# Hence using "../"
build:
	docker build --cache-from docker.io/$(PROJECT)/$(IMAGE):latest \
		-t docker.io/$(PROJECT)/$(IMAGE):$(VERSION) \
		-t docker.io/$(PROJECT)/$(IMAGE):latest -f Dockerfile ../


push:
	docker push docker.io/$(PROJECT)/$(IMAGE):latest
	docker push docker.io/$(PROJECT)/$(IMAGE):$(VERSION)


.PHONY: image push

release: lint test build push
