# Kubernetes

## Install cert-manager

``` bash
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml
```

## Install letsencrypt

``` bash
kubectl apply -f letsencrypt.yaml
```

## Install authelia

``` bash
kubectl apply -f authelia.yaml
```
