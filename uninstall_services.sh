#!/bin/bash

kubens mtls-example
kubectl delete -f serviceA/deployment.yaml
kubectl delete -f serviceB/deployment.yaml
