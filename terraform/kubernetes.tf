resource "proxmox_vm_qemu" "rke2" {
  name                    = "k8s-rke2"
  target_node             = "proxmox"
  vmid                    = 110
  desc                    = "Kubernetes single node cluster."
  onboot                  = true
  boot                    = "order=scsi0;ide2"
  agent                   = 1
  clone                   = var.proxmox_cloud_init_template
  full_clone              = true
  memory                  = 65536
  balloon                 = 0
  sockets                 = 1
  cores                   = 12
  hotplug                 = "disk,network,usb"
  scsihw                  = "virtio-scsi-pci"
  tags                    = "k8s;kubernetes;rke2"
  os_type                 = "cloud-init"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0               = "ip=192.168.134.110/24,gw=192.168.134.1"
  ciuser                  = var.ssh_user
  cipassword              = var.ssh_password
  sshkeys                 = var.ssh_pub_keys
  network {
    model   = "virtio"
    bridge  = "vmbr0"
    macaddr = "00:00:C0:A8:86:6E" # equals ip
  }
  disk {
    type    = "scsi"
    size    = "128G"
    slot    = 0
    format  = "raw"
    storage = "local-lvm"
    backup  = 1
  }
}