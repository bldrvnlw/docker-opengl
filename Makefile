# Docker organization to pull the images from
ORG = ikeyasu

# Name of image
IMAGE = opengl

# Docker TAG
TAG = cuda9.1-cudnn7-devel-ubuntu16.04-tmux

build:
	docker build \
		-t $(ORG)/$(IMAGE):$(TAG) \
		--build-arg IMAGE=$(ORG)/$(IMAGE):$(TAG) \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		--build-arg VCS_URL=`git config --get remote.origin.url` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		--no-cache \
		.

example:
	docker build --runtime=nvidia \
		-t $(ORG)/$(IMAGE)-example:$(TAG) example/

push:
	docker push $(ORG)/$(IMAGE):$(TAG)

.PHONY: build example push
