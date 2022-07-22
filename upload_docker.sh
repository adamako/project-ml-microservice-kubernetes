#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="adamako/prediction-app:latest"

# Step 2:  
# Authenticate & tag
docker login
docker image tag prediction-app $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
docker push $dockerpath
