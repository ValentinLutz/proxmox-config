# Ansible

## Preconditions
``` bash
export ANSIBLE_STDOUT_CALLBACK=debug
```

### File secrets.yaml
``` yaml
###############################################################
#                     Ansible secrets                         #
###############################################################
ansible_user: 

###############################################################
#                     Traefik secrets                         #
###############################################################
traefik_namecheap_api_user: 
traefik_namecheap_api_key: 

###############################################################
#                     Authelia secrets                        #
###############################################################
authelia_notifier_smtp_password: 
authelia_jwt_secret: 

###############################################################
#                     WireGuard secrets                       #
###############################################################
wireguard_server_private_key:
wireguard_client_public_key:

###############################################################
#                     Kubernetes secrets                       #
###############################################################
k3s_token: 
```

## Run all

``` bash
ansible-playbook -i hosts.ini playbook.yaml
```
