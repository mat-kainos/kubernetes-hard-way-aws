# Kubernetes The Hard Way

This tutorial walks you through setting up Kubernetes the hard way. This guide is not for people looking for a fully automated command to bring up a Kubernetes cluster. If that's you then check out [Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine), or the [Getting Started Guides](http://kubernetes.io/docs/getting-started-guides/).

Kubernetes The Hard Way is optimized for learning, which means taking the long route to ensure you understand each task required to bootstrap a Kubernetes cluster.

> The results of this tutorial should not be viewed as production ready, and may receive limited support from the community, but don't let that stop you from learning!

## Note
This guide is based on 
[updated and revised version Kubernetes The Hard Way guide AWS](https://github.com/michalschott/kubernetes-hard-way-aws) which is based on
[original Kubernetes The Hard Way guide](https://github.com/kelseyhightower/kubernetes-the-hard-way) which leverage Google Cloud Platform.

The main differences are:
* AWS instead of GCP
* docker instead of container-d
* kubernetes 1.14.2 instead of 1.9.7
* one master and one worker, no load balancers

## Target Audience

The target audience for this tutorial is someone planning to support a production Kubernetes cluster and wants to understand how everything fits together.

## Cluster Details

Kubernetes The Hard Way guides you through bootstrapping a highly available Kubernetes cluster with end-to-end encryption between components and RBAC authentication. Because not everyone have publicly available domain, we will build GOSSIP-only cluster.

* [Kubernetes](https://github.com/kubernetes/kubernetes) 1.14.2
* [Docker Runtime](https://docker.com) TBD
* [CNI Container Networking](https://github.com/containernetworking/cni) TBD
* [etcd](https://github.com/coreos/etcd) TBD

## Labs

This tutorial assumes you have access to the [AWS Cloud](https://aws.amazon.com). While AWS is used for basic infrastructure requirements the lessons learned in this tutorial can be applied to other platforms.

* [Prerequisites](docs/01-prerequisites.md)
* [Installing the Client Tools](docs/02-client-tools.md)
* [Provisioning Compute Resources](docs/03-compute-resources.md)
* [Provisioning the CA and Generating TLS Certificates](docs/04-certificate-authority.md)
* [Generating Kubernetes Configuration Files for Authentication](docs/05-kubernetes-configuration-files.md)
* [Generating the Data Encryption Config and Key](docs/06-data-encryption-keys.md)
* [Bootstrapping the etcd Cluster](docs/07-bootstrapping-etcd.md)
* [Bootstrapping the Kubernetes Control Plane](docs/08-bootstrapping-kubernetes-controllers.md)
* [Bootstrapping the Kubernetes Worker Nodes](docs/09-bootstrapping-kubernetes-workers.md)
