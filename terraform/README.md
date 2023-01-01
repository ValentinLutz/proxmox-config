# Terraform

## Create cloud image template in proxmox

```shell
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
apt install libguestfs-tools
virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent

qm create 1000 --name ubuntu-2204-cloud-init-template --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci
qm set 1000 --scsi0 local-lvm:0,import-from=/root/jammy-server-cloudimg-amd64.img

qm set 1000 --ide2 local-lvm:cloudinit
qm set 1000 --boot order=scsi0
qm set 1000 --serial0 socket --vga serial0
qm template 1000
```

## Create file for secrets

secrets.tfvars

```properties
proxmox_user=""
proxmox_password=""
ssh_user=""
ssh_password=""
ssh_pub_keys=""
```