## Install longhorn

```shell
helm repo add longhorn https://charts.longhorn.io
helm repo update
```

```shell
helm install longhorn longhorn/longhorn \
  --namespace longhorn-system \
  --create-namespace \
  --version 1.4.1
```

```shell
kubectl apply --kustomize longhorn
```