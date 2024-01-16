#!/bin/bash

echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc

# Установка Kind Kubernetes с именем кластера "webboks" и одной worker нодой
echo "Установка Kind Kubernetes..."
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/

echo "Создание Kind Kubernetes кластера..."
kind create cluster --name webboks --config=<(echo '
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: webboks
nodes:
- role: control-plane
- role: worker
networking:
  apiServerAddress: "158.160.127.224"
  apiServerPort: 6443
')

# Создание namespaces
echo "Создание namespaces..."
kubectl create namespace app

echo "Настройка завершена."
