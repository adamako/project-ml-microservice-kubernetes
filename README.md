
[![adamako](https://circleci.com/gh/adamako/project-ml-microservice-kubernetes.svg?style=svg)](https://github.com/adamako/project-ml-microservice-kubernetes/)

## Project Overview

Prediction-app is a Python flask application that use `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing).

### Project goal

Operationalize machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications.

### Project features

* Circleci for CI/CD
* Build and run a docker image of prediction-app 
* Upload prediction-app container to docker hub
* Deploy the container using Kubernetes and make a prediction

### Some files and directories explanation
* `.circleci` contains pipeline script
* `model_data/housing.csv` contains sample data to predict from
* `app.py` prediction program
* `requirements.txt` contains application dependencies
* `output_txt_files` contains sample of app running logs

---
## Clone project
```bash
  $ git clone git@github.com:adamako/project-ml-microservice-kubernetes.git
```
## Setup the Environment

### Requirements

* [Python 3.7 is required](https://phoenixnap.com/kb/how-to-install-python-3-ubuntu)
* [Hadolint](https://github.com/hadolint/hadolint)
* [kubernetes](https://kubernetes.io/releases/download/)
* [minikube](https://minikube.sigs.k8s.io/docs/start/)
* [Create docker account](https://hub.docker.com/)
* Edit dockerpath in `upload_docker.sh` and `run_kubernetes.sh`



### Install dependencies

```bash
$ cd project-ml-microservice-kubernetes/
# Run make setup to create virtualenv and activate it
$ make setup
# Run make install to install the necessary dependencies
$ make install
# Run make lint to check python script and dockerfile
$ make lint
```

### Build container and run
```bash
# Build and run 
$ ./run_docker.sh

# Make a prediction
$ ./make_predicton.sh
```

### Upload the container to Docker Hub
```bash 
$ ./upload_docker.sh
```

### Run in kubernetes
```bash 
# Start a cluster
$ minicube start

# Run container in kubernetes (run script again after pod creation)
$ ./run_kubernetes

# Check pod status
$ kubectl get pods prediction-app

# Make a prediction (be sure web app is running on port 8000)
$ ./make_predicton.sh

# Delete the pod
$ kubectl delete pods prediction-app

# Stop the cluster and delete
$ minicube stop && minicube delete
```