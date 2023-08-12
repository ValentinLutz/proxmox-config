resource "proxmox_vm_qemu" "haproxy" {
  name                    = "reverse-proxy-haproxy"
  target_node             = "proxmox"
  vmid                    = 101
  desc                    = "Reverse proxy for proxmox virtual machines."
  onboot                  = true
  boot                    = "order=scsi0;ide2"
  agent                   = 1
  clone                   = var.proxmox_cloud_init_template
  full_clone              = true
  memory                  = 2048
  balloon                 = 0
  sockets                 = 1
  cores                   = 1
  hotplug                 = "disk,network,usb"
  scsihw                  = "virtio-scsi-pci"
  tags                    = "reverse-proxy;haproxy"
  os_type                 = "cloud-init"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0               = "ip=192.168.134.101/24,gw=192.168.134.1,ip6=auto"
  ciuser                  = var.ssh_user
  cipassword              = var.ssh_password
  sshkeys                 = var.ssh_pub_keys
  network {
    model   = "virtio"
    bridge  = "vmbr0"
    macaddr = "00:00:C0:A8:86:65" # equals ip
  }
  disk {
    type    = "scsi"
    size    = "8G"
    slot    = 0
    format  = "raw"
    storage = "local-lvm"
    backup  = 1
  }
}