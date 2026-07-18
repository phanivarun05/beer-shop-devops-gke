# Docker Configuration
DOCKERFILE = docker/generic/Dockerfile
IMAGE_PREFIX = beer-shop
TAG = v1

.PHONY: catalog cart courier build clean

catalog:
	docker build -f $(DOCKERFILE) --build-arg SERVICE_PATH=catalog/service -t $(IMAGE_PREFIX)/catalog:$(TAG) .

cart:
	docker build -f $(DOCKERFILE) --build-arg SERVICE_PATH=cart/service -t $(IMAGE_PREFIX)/cart:$(TAG) .

courier:
	docker build -f $(DOCKERFILE) --build-arg SERVICE_PATH=courier/job -t $(IMAGE_PREFIX)/courier:$(TAG) .

build: catalog cart courier

clean:
	-docker rmi \
		$(IMAGE_PREFIX)/catalog:$(TAG) \
		$(IMAGE_PREFIX)/cart:$(TAG) \
		$(IMAGE_PREFIX)/courier:$(TAG)