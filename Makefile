LATEST_VERSION := v1.0
REPOSITORY := caruccio
IMAGE_NAME := certificate-checker
IMAGE := $(REPOSITORY)/$(IMAGE_NAME):$(LATEST_VERSION)
LATEST := $(REPOSITORY)/$(IMAGE_NAME):latest

.PHONY: default
default: image

.PHONY: image
image:
	docker build . -t $(IMAGE) --no-cache

.PHONY: tag
tag:
	docker tag $(LATEST) $(IMAGE)

.PHONY: push
push: tag
	docker push $(LATEST)
	docker push $(IMAGE)
