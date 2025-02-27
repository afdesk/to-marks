#!/bin/sh

kind delete cluster && kind create cluster
echo "Waiting for nodes"
kubectl wait --for=condition=Ready --timeout 300s nodes --all

kubectl create namespace trivy-system

git clone --depth=1 https://github.com/aquasecurity/trivy-operator.git
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_clustercompliancereports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_clusterconfigauditreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_clusterinfraassessmentreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_clusterrbacassessmentreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_clustersbomreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_clustervulnerabilityreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_configauditreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_exposedsecretreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_infraassessmentreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_rbacassessmentreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_sbomreports.yaml
kubectl apply -f ./trivy-operator/deploy/helm/crds/aquasecurity.github.io_vulnerabilityreports.yaml