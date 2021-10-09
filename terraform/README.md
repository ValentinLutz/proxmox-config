# Terraform

## Create file for secrets
secret.tfvars
``` properties
proxmox_user = ""
proxmox_password = ""

ssh_user = ""
ssh_password = ""
```

## Apply resources
``` bash
terraform apply -var-file="secret.tfvars"
```
