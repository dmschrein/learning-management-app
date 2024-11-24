# Define variables for image name and tag
IMAGE_NAME = learning-management-app
DOCKERFILE = Dockerfile

# Default target to build the Docker image
.PHONY: build
build:
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE) .

# Run the linter using the built image
.PHONY: lint
lint:
	docker run --rm $(IMAGE_NAME)

# Clean up dangling images
.PHONY: clean
clean:
	docker image prune -f

# Remove the built Docker image
.PHONY: remove-image
remove-image:
	docker rmi -f $(IMAGE_NAME)
