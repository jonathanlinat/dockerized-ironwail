#!/bin/bash

# Exit script on error
set -e

# Clear the command prompt
clear

# Validate the build environment
BUILD_ENV=${1:-linux}
case "$BUILD_ENV" in
  linux)
    ;;
  *)
    echo "Error: Invalid build environment '${BUILD_ENV}'. Allowed value is linux."
    exit 1
    ;;
esac

# Define image and container names
IMAGE_NAME=$(echo "dockerized-ironwail-${BUILD_ENV}" | tr '[:upper:]' '[:lower:]')
CONTAINER_NAME="${IMAGE_NAME}-container"

# Build the Docker image
DOCKER_BUILDKIT=1 docker build -f ./Dockerfile.$BUILD_ENV -t $IMAGE_NAME .

# Check if the container already exists; if so, delete it
if [ $(docker ps -a -q -f name=^/$CONTAINER_NAME$) ]; then
    docker rm $CONTAINER_NAME
fi

# Create a new container
docker run -d --name $CONTAINER_NAME $IMAGE_NAME

# Define build paths
BUILD_SOURCE_PATH=ironwail/Quake
BUILD_DESTINATION_PATH=ironwail/build/$BUILD_ENV

# Check if the folder exists, if so, delete it
if [ -d "./$BUILD_DESTINATION_PATH" ]; then
  rm -rf "./$BUILD_DESTINATION_PATH"
fi

# Ensure local build directory exists, create it if it does not
mkdir -p ./$BUILD_DESTINATION_PATH

# Loop over each file and copy it
FILES_TO_COPY=("ironwail" "ironwail.pak")
for file in "${FILES_TO_COPY[@]}"; do
  docker cp "$CONTAINER_NAME:/$BUILD_SOURCE_PATH/$file" "./$BUILD_DESTINATION_PATH/$file"
done

# Stop and remove the container
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo "Building process of Ironwail (${BUILD_ENV}) completed successfully!"
