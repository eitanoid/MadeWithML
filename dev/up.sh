#!/usr/bin/env bash

kind create cluster --config dev/kind.yaml

# https://docs.ray.io/en/master/cluster/kubernetes/getting-started/kuberay-operator-installation.html#kuberay-operator-deploy
helm repo add kuberay https://ray-project.github.io/kuberay-helm/
helm repo update
kubectl create namespace ray-system
helm install kuberay-operator kuberay/kuberay-operator --version 1.7.0 -n ray-system

# install the CRD
helm install raycluster kuberay/ray-cluster --version 1.7.0
