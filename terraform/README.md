# Terraform

## Create file for secrets
secret.tfvars
``` properties
proxmox_user = ""
proxmox_password = ""

ssh_user = ""
ssh_password = ""
ssh_pub_keys = ""
```

## Apply resources
``` bash
terraform apply -var-file="secret.tfvars"
```

## Destroy resources
``` bash
terraform destory -var-file="secret.tfvars"
```
