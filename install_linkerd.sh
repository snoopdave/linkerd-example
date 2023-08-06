
#!/bin/bash

# Install Linkerd CLI
curl -sL https://run.linkerd.io/install | sh
export PATH=$PATH:$HOME/.linkerd2/bin

linkerd check --pre                     # validate that Linkerd can be installed
linkerd install --crds | kubectl apply -f - # install the Linkerd CRDs
linkerd install --set proxyInit.runAsRoot=true | kubectl apply -f -    # install the control plane into the 'linkerd' namespace
linkerd check                           # validate everything worked!

linkerd viz install | kubectl apply -f -  # install the viz extension into the 'linkerd-viz' namespace
linkerd viz check                         # validate the extension works!
linkerd viz dashboard                     # launch the dashboard

