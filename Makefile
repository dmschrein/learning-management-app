# Variables for client and server images
CLIENT_IMAGE = learning-management-app-client
SERVER_IMAGE = learning-management-app-server

# Build client image
.PHONY: build-client
build-client:
	docker build -t $(CLIENT_IMAGE) -f Dockerfile .

# Build server image
.PHONY: build-server
build-server:
	docker build -t $(SERVER_IMAGE) -f Dockerfile .

# Lint client
.PHONY: lint-client
lint-client: build-client
	docker run --rm $(CLIENT_IMAGE)

# Lint server (if needed)
.PHONY: lint-server
lint-server: build-server
	docker run --rm $(SERVER_IMAGE)
