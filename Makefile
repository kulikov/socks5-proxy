VERSION?=$(shell git describe --tags --abbrev=0 | sed 's/v//')
TAG="kulikov/socks5-proxy"

release:
	@echo "==> Build and publish new docker image..."
	docker build -t ${TAG}:latest -t ${TAG}:${VERSION} .
	docker push ${TAG}:${VERSION}
	docker push ${TAG}:latest