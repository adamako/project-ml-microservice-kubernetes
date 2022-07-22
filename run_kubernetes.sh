#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

#This is your Docker ID/path
dockerpath="adamako/prediction-app:latest"

# Run the Docker Hub container with kubernetes
kubectl run prediction-app\
    --image=$dockerpath\
    --port=80 --labels app=prediction-app


# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl port-forward prediction-app 8000:80


