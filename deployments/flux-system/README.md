### Bootstrap Flux V2 toolkit
https://toolkit.fluxcd.io/
https://toolkit.fluxcd.io/guides/installation/
```
curl -s https://toolkit.fluxcd.io/install.sh | sudo bash

# enable completions in ~/.bash_profile
. <(flux completion bash)
```
```
# Verify
flux check --pre
```
```
export GITHUB_TOKEN=<your-token>
export GITHUB_USER=<your-username>
```
```
flux bootstrap github \
  --owner=zenxedo \
  --repository=k3s-gitops \
  --branch=master \
  --path=./deployments \
  --components=source-controller,kustomize-controller,helm-controller,notification-controller \
  --personal \
  --version=latest
``` 

```
flux reconcile ks flux-system --with-source
```
