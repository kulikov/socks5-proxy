VERSION?=$(shell git describe --tags --abbrev=0 | sed 's/v//')
TAG="kulikov/socks5-proxy"

release:
	@echo "==> Build and publish new docker image..."
	docker build -t ${TAG}:latest -t ${TAG}:${VERSION} .
	docker push ${TAG}:${VERSION}
	docker push ${TAG}:latest

run:
	docker run --rm -p 1080:1080 -v ${PWD}/passwd:/etc/passwd ${TAG}
