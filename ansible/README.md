# Ansible

## Preconditions

### File secrets.yaml
``` yaml
###############################################################
#                     Ansible secrets                         #
###############################################################
ANSIBLE_USER: 

###############################################################
#                     Traefik secrets                         #
###############################################################
TRAEFIK_NAMECHEAP_API_USER: 
TRAEFIK_NAMECHEAP_API_KEY: 

###############################################################
#                     Authelia secrets                        #
###############################################################
AUTHELIA_NOTIFIER_SMTP_PASSWORD: 
AUTHELIA_JWT_SECRET: 

###############################################################
#                     WireGuard secrets                       #
###############################################################
WIREGUARD_SERVER_PRIVATE_KEY:
WIREGUARD_CLIENT_PUBLIC_KEY:
```

## Run all

``` bash
ansible-playbook -i hosts.ini playbook.yaml
```