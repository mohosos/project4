#!/usr/bin/env bash

dockerpath=mohoss/pro4

# Run the Docker Hub container with kubernetes
kubectl run --generator=run-pod/v1 --image=$dockerpath mohoss/pro4 --port=80 --labels='app=mohoss'

# List kubernetes pods
kubectl get pods

# while loop for pod status
while [ "$(kubectl describe pods machine-learning-app | grep ^Status: | head -1 | awk '{print $2}' | tr -d '\n')" != "Running" ]; do
    echo "Waiting for POD status: $(kubectl describe pods mohoss | grep ^Status: | head -1 | awk '{print $2}' | tr -d '\n')"
done
echo "POD status is Running"

# Forward the container port to a host
kubectl port-forward --address 0.0.0.0 pod/mohoss 80:80

# Shows logs of containers
kubectl logs -lapp=mohoss --all-containers=true
© 2020 GitHub, Inc.