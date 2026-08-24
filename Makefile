
# ============================================================
# Docker Configuration
# ============================================================

DOCKERFILE_BACKEND := docker/generic/Dockerfile
DOCKERFILE_FRONTEND := docker/frontend/Dockerfile

IMAGE_PREFIX := beer-shop
TAG ?= latest

.PHONY: \
	catalog user payment order shipping courier cart \
	shop-interface shop-admin \
	web-shop web-admin \
	build-backend build-frontend build-docker clean

catalog:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=catalog/service \
		-t $(IMAGE_PREFIX)/catalog:$(TAG) .

user:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=user/service \
		-t $(IMAGE_PREFIX)/user:$(TAG) .

payment:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=payment/service \
		-t $(IMAGE_PREFIX)/payment:$(TAG) .

order:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=order/service \
		-t $(IMAGE_PREFIX)/order:$(TAG) .

shipping:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=shipping/service \
		-t $(IMAGE_PREFIX)/shipping:$(TAG) .

courier:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=courier/job \
		-t $(IMAGE_PREFIX)/courier:$(TAG) .

cart:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=cart/service \
		-t $(IMAGE_PREFIX)/cart:$(TAG) .

shop-interface:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=shop/interface \
		-t $(IMAGE_PREFIX)/shop-interface:$(TAG) .

shop-admin:
	docker build -f $(DOCKERFILE_BACKEND) \
		--build-arg SERVICE_PATH=shop/admin \
		-t $(IMAGE_PREFIX)/shop-admin:$(TAG) .

web-shop:
	docker build -f $(DOCKERFILE_FRONTEND) \
		--build-arg APP_PATH=shop \
		-t $(IMAGE_PREFIX)/web-shop:$(TAG) .

web-admin:
	docker build -f $(DOCKERFILE_FRONTEND) \
		--build-arg APP_PATH=admin \
		-t $(IMAGE_PREFIX)/web-admin:$(TAG) .

build-backend: \
	catalog \
	user \
	payment \
	order \
	shipping \
	courier \
	cart \
	shop-interface \
	shop-admin

build-frontend: \
	web-shop \
	web-admin

build-docker: build-backend build-frontend

# ============================================================
# Security Scanning
# ============================================================

# Services built using the generic Go Dockerfile
GO_SERVICES = \
	catalog \
	user \
	payment \
	order \
	shipping \
	courier \
	cart \
	shop-interface \
	shop-admin

WEB_SERVICES = \
	web-shop \
	web-admin

TRIVY := trivy
SECURITY_SEVERITY := HIGH,CRITICAL

security-scan:
	@echo "========================================"
	@echo "Running Trivy security scans"
	@echo "Severity: $(SECURITY_SEVERITY)"
	@echo "========================================"

	@for service in $(GO_SERVICES); do \
		echo ""; \
		echo "Scanning $(IMAGE_PREFIX)/$$service:$(TAG)"; \
		$(TRIVY) image \
			--severity $(SECURITY_SEVERITY) \
			--exit-code 1 \
			$(IMAGE_PREFIX)/$$service:$(TAG); \
	done

	@for service in $(WEB_SERVICES); do \
		echo ""; \
		echo "Scanning $(IMAGE_PREFIX)/$$service:$(TAG)"; \
		$(TRIVY) image \
			--severity $(SECURITY_SEVERITY) \
			--exit-code 1 \
			$(IMAGE_PREFIX)/$$service:$(TAG); \
	done

	@echo ""
	@echo "========================================="
	@echo "All security scans passed"
	@echo "========================================="
