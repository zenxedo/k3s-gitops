# Kubernetes K3s, Helm, Flux V2 Toolkit, Gitops, Proxmox!

### Install ubuntu clouinit on proxmox

### Creating the base template from the ubuntu cloud-init image:
 https://pve.proxmox.com/wiki/Cloud-Init_Support#_preparing_cloud_init_templates
 https://gist.github.com/in0rdr/d43db0f313eae0986dfba727007a5a5b
 https://pve.proxmox.com/pve-docs/qm.1.html
```
qm create 9000 --name focal-server-cloudimg-amd64 --memory 4096 --cpu cputype=host --cores 4 --serial0 socket --vga serial0 --net0 virtio,bridge=vmbr0 --agent enabled=1
qm importdisk 9000 /mnt/pve/FREENAS5/template/iso/focal-server-cloudimg-amd64.img local-zfs -format qcow2
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-zfs:vm-9000-disk-0
qm set 9000 --ide2 local-zfs:cloudinit
qm set 9000 --boot c --bootdisk scsi0
qm template 9000
```
```
qm clone 9000 123 --name k3s
qm set 123 --sshkey ~/.ssh/id_rsa.pub
qm set 123 --ipconfig0 ip=10.68.69.3/24,gw=10.68.69.1
```
### Install Docker 

https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

```
$ sudo apt-get update

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```


```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```
$ sudo apt-key fingerprint 0EBFCD88

pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```

```
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

```
 $ sudo apt-get update
 $ sudo apt-get install docker-ce docker-ce-cli containerd.io
```


### Install K3s
https://github.com/rancher/k3s
```
curl -sfL https://get.k3s.io | sh -
```
Change permissions to global. this is creates a security risk and should only be used for testing but was needed to get working quickly

```
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --no-deploy=traefik
```
```
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
```
Optional: To start using your cluster, you need to run the following as a regular user:
```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

export KUBECONFIG="~/.kube/config:/etc/rancher/k3s/k3s.yaml"
```

### Install Helm
```
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
```

### Bootstrap Flux V2 toolkit
https://toolkit.fluxcd.io/
https://toolkit.fluxcd.io/guides/installation/
```
curl -s https://toolkit.fluxcd.io/install.sh | sudo bash

# enable completions in ~/.bash_profile
. <(flux completion bash)
```
verify
```
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
  --path= \
  --personal
 ```
 ### Must install if using NFS provisioner
 ```
 sudo apt update && sudo apt install -y nfs-common
 ```

### Helpful Commands
```
watch kubectl -n flux-system get pods
kubectl get ns
kubectl get nodes
kubectl get service
kubectl get pv
kubectl get deployments
kubectl get storageclass
kubectl get pods -n foo
kubectl get pods --all-namespaces
kubectl get pods,deployments,services,helmreleases,pv --namespace=media
kubectl patch pv nfs-data-pv -p '{"spec":{"persistentVolumeReclaimPolicy":"Delete"}}'


kubectl delete pvc --all 
kubectl delete --all pods,deployments,services,helmreleases,pv --namespace=media

kubectl delete --all deployments --namespace=default
kubectl delete services hello-world
kubectl delete deployment hello-world
kubectl delete namespace foo
kubectl delete pv <pv_name> --grace-period=0 --force

sudo systemctl "status,stop,start,or restart" k3s

kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'

(PersistentVolume, PersistentVolumeClaim, StorageClass, Deployment, StatefulSet, DaemonSet, etc


uninstall ks3
/usr/local/bin/k3s-uninstall.sh


curl https://raw.githubusercontent.com/zenxedo/k3s-gitops/master/bootstrap-cluster.sh | bash
git clone https://github.com/zenxedo/k3s-gitops.git $HOME/gitops

flux reconcile ks flux-system --with-source
flux reconcile hr flux-system --with-source
```

### Explanation of Ingress services
https://www.youtube.com/watch?v=SdhCbs7g6ZY
