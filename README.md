### My home Kubernetes cluster

[![k3s](https://img.shields.io/badge/k3s-v1.18.8-orange?style=flat-square)](https://k3s.io/) [![GitHub stars](https://img.shields.io/github/stars/zenxedo/k3s-gitops?color=green&style=flat-square)](https://github.com/zenxedo/k3s-gitops/stargazers) [![GitHub issues](https://img.shields.io/github/issues/zenxedo/k3s-gitops?style=flat-square)](https://github.com/zenxedo/k3s-gitops/issues) [![GitHub last commit](https://img.shields.io/github/last-commit/zenxedo/k3s-gitops?color=purple&style=flat-square)](https://github.com/zenxedo/k3s-gitops/commits/master) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/zenxedo/k3s-gitops/lint?color=blue&style=flat-square) [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=flat-square)](https://github.com/pre-commit/pre-commit)

</div>

---

# :book:&nbsp; Overview

This repo _is_ my Kubernetes cluster in a declarative state. [Flux Toolkit V2](https://toolkit.fluxcd.io/) and [Helm Controller](https://github.com/fluxcd/helm-controller) watch my [deployments](./deployments) folder and makes the changes to my cluster based on the yaml manifests.

Check out my FluxV2 [README](./deployments/flux-system/README.md)

---

## :handshake:&nbsp; Thanks

A lot of inspiration for this repo came from the following people:

K8s-at-home
Discord(https://discord.gg/DNCynrJ)
Github(https://github.com/k8s-at-home/charts)

- [onedr0p/k3s-gitops](https://github.com/onedr0p/k3s-gitops)
- [billimek/k8s-gitops](https://github.com/billimek/k8s-gitops)
- [bjw-s/k8s-gitops](https://github.com/bjw-s/k8s-gitops)
- [nickysemenza/k3s](https://github.com/nickysemenza/k3s)
- [carpenike/k8s-gitops](https://github.com/carpenike/k8s-gitops)
- [toboshii/k8s-gitops](https://github.com/toboshii/k8s-gitops)
