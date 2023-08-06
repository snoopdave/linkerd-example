#!/bin/bash

# Create and switch to namespace
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: mtls-example
EOF
kubens mtls-example

#------------------------------------------------
# Service A

cd serviceA || exit
docker build -t servicea:latest .

# Push the image to Docker registry. Replace snoopdave with your Docker username.
docker tag servicea:latest snoopdave/servicea:latest
docker push snoopdave/servicea:latest

kubectl apply -f deployment.yaml
cd ..

#------------------------------------------------
# Service B

cd serviceB || exit
docker build -t serviceb:latest .

# Push the image to Docker registry. Replace snoopdave with your Docker username.
docker tag serviceb:latest snoopdave/serviceb:latest
docker push snoopdave/serviceb:latest

# Apply Kubernetes configurations for service B
kubectl apply -f deployment.yaml
cd ..
