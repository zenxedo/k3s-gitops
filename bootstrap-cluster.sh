#!/bin/bash

REPO_ROOT=$(git rev-parse --show-toplevel)

installKs3() {
  message "installing ks3"
  curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --no-deploy=traefik
}

installdocker() {
  message "installing docker"
  curl -fsSL get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
}

need() {
  which "$1" &>/dev/null || die "Binary '$1' is missing but required"
}

need "kubectl"
need "helm"

message() {
  echo -e "\n######################################################################"
  echo "# $1"
  echo "######################################################################"
}

installFlux() {
  message "installing flux"
  
  FLUX_READY=1
  while [ $FLUX_READY != 0 ]; do
    echo "waiting for flux pod to be fully ready..."
    kubectl -n flux wait --for condition=available deployment/flux
    FLUX_READY="$?"
    sleep 5
  done
}

message "all done!"
kubectl get nodes -o=wide
