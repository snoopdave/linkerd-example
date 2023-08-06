
kubectl get -n mtls-example deploy -o yaml \
  | linkerd inject - \
  | kubectl apply -f -
