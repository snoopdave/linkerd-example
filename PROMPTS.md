# PROMPTS.md

The initial prompt and subsequent prompts used to create and refine this project.

## The initial prompt

I would like to understand LinkerD by creating an example project. I want you to assume I have a Kubernetes cluster and I know how to administer it via kubectl. I have complete confidence that you can complete this assignment.

Service A is an HTTP service running on Node.js that returns a random number as a string at the end-point /random.

Service B is an HTTP service running on Node.js that takes a parameter “name” and responds with the string “Hello ${name} here’s your random number ${number}” (substituting the name and fresh new random number that  obtained from service A)

LinkerD should be deployed to the cluster and configured to require MTLS in the communications between Service B and Service A.

This example project should provide bash scripts and YAML files for configuring a Kubernetes cluster as well as the code for each service. There should at least be these files:

install_linkerd.sh - this script installs linkerd into my cluster and configures it

install_services.sh - this script builds the docker files for the services and deploys them to the kubernetes cluster

Provide a list of all the files you will generate and then the complete listing for each and every file.

## Subsequent prompts

Below are the subsequent prompts that I used as I was trying to make the code produced by the initial prompt to work.
I have not included the output of all of these prompts in the project because some were just not that good, e.g. the design document and blog posts.

* How do I verify that inter-service communications is mTLS?

* For the k8s MTLS project linkerd above, write an installation guide that explains how to install and run the example given that there already exists a Kubernetes cluster with LinkerD installed

* Please double-check and confirm that the `install_services.sh` script will work with the instructions provided above and the code that you have provided for the project

* Create a blog post by a user who setup the project above and then used kubectl exec to shell into servicesA and B and used curl to call each other. The blog post should show all setup he had to do and the actual curl commands and example output

* Given all of the above, I would like you to write a software design document that lays out the entire project with Kubernetes, LinkerD, Service A and Service B. The appendix should project a listing of the files in the project and a sentence about what each one does.

## Things I added

I rewrote almost the entire `install_linkerd.sh`script based on the output of `linkerd --help`. ChatGPT did not come close to getting this right.

I wrote the `enmesh_services.sh` script because ChatGPT did no include that part.

I did some re-organization in `install_services.sh` to make it more readable.