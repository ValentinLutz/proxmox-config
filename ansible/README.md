# Ansible

## Preconditions

```shell
export ANSIBLE_STDOUT_CALLBACK=debug
```

## Create files for secrets

wireguard.secrets.yaml

```yaml
wireguard_server_private_key:
wireguard_client_public_key:
```

### File secrets.yaml

```yaml
###############################################################
#                     Ansible secrets                         #
###############################################################
ansible_user:

###############################################################
#                     Kubernetes secrets                       #
###############################################################
k3s_token: 
```
