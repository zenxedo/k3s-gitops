<h1 align="center">
  My home Kubernetes cluster :sailboat:
  <br />
  <br />
  <img src="https://i.imgur.com/p1RzXjQ.png">
</h1>
<br />
<div align="center">

[![k3s](https://img.shields.io/badge/k3s-v1.18.8-orange?style=flat-square)](https://k3s.io/) [![GitHub stars](https://img.shields.io/github/stars/zenxedo/k3s-gitops?color=green&style=flat-square)](https://github.com/zenxedo/k3s-gitops/stargazers) [![GitHub issues](https://img.shields.io/github/issues/zenxedo/k3s-gitops?style=flat-square)](https://github.com/zenxedo/k3s-gitops/issues) [![GitHub last commit](https://img.shields.io/github/last-commit/zenxedo/k3s-gitops?color=purple&style=flat-square)](https://github.com/zenxedo/k3s-gitops/commits/master) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/zenxedo/k3s-gitops/lint?color=blue&style=flat-square) [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=flat-square)](https://github.com/pre-commit/pre-commit)

</div>

---

# :book:&nbsp; Overview

Welcome to my home Kubernetes cluster. This repo _is_ my Kubernetes cluster in a declarative state. [Flux](https://github.com/fluxcd/flux) and [Helm Operator](https://github.com/fluxcd/helm-operator) watch my [deployments](./deployments/) folder and makes the changes to my cluster based on the yaml manifests.

---

## :wrench:&nbsp; Tools

_Below are some of the tools I find useful for working with my cluster_

| Tool                                                   | Purpose                                                                                                   |
|--------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| [direnv](https://github.com/direnv/direnv)             | Set `KUBECONFIG` environment variable based on present working directory                                  |
| [git-crypt](https://github.com/AGWA/git-crypt)         | Encrypt certain files in my repository that can only be decrypted with a key on my computers              |

---

## :computer:&nbsp; Hardware configuration

_All my Kubernetes master and worker nodes below are running bare metal Ubuntu 20.04.x_

| Device                  | Count | OS Disk Size | Data Disk Size      | Ram  | Purpose                                |
|-------------------------|-------|--------------|---------------------|------|----------------------------------------|
| Proxmox                 | 1     | 10GB SSD     | N/A                 | 16GB | k8s Master                             |
| Intel NUC8i5BEH         | 3     | 120GB SSD    | 1TB NVMe (longhorn) | 32GB | k8s Workers                            |


---

## :memo:&nbsp; IP addresses

_This table is a reference to IP addresses in my deployments and may not be fully up-to-date_

| Deployment               | Address        |
|--------------------------|----------------|
| nginx-ingress (external) | 192.168.69.100 |
| nginx-ingress (internal) | 192.168.69.101 |


---

## :handshake:&nbsp; Thanks

A lot of inspiration for this repo came from the following people:

- [billimek/k8s-gitops](https://github.com/billimek/k8s-gitops)
- [onedr0p/k3s-gitops](https://github.com/onedr0p/k3s-gitops)
