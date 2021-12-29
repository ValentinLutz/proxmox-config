# Kubernetes

## Install cert-manager

``` bash
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml
```

## Install letsencrypt

``` bash
kubectl apply -f letsencrypt
```

## Install authelia

``` bash
kubectl apply -f authelia
```

## Install homer

``` bash
kubectl apply -f homer
```

## Install Jenkins

``` bash
kubectl apply -f jenkins
```
