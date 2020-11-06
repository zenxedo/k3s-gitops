Install yq
```
wget https://github.com/mikefarah/yq/releases/download/{VERSION}/{BINARY} -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq
```
Install kubeseal
```
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.13.1/kubeseal-linux-amd64 -O kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
```

Install kubectl
