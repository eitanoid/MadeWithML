#!/usr/bin/env bash

kind create cluster --config dev/kind.yaml

helm repo add kuberay https://ray-project.github.io/kuberay-helm/
helm repo update
kubectl create namespace ray-system
helm install kuberay-operator kuberay/kuberay-operator --version 1.7.0 -n ray-system
