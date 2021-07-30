resource "proxmox_vm_qemu" "traefik" {
  name = "traefik-reverse-proxy"
  target_node = "proxmox"
  vmid = 100
  desc = "Reverse proxy for proxmox virtual machines."
  onboot = true
  boot = "order=scsi0"
  agent = 1
  clone = "ubuntu-2004-cloud-init-template"
  full_clone = true
  memory = 2048
  balloon = 0
  sockets = 1
  cores = 2
  hotplug = "disk,network,usb"
  scsihw = "virtio-scsi-pci"
  tags = "traefik, reverse-proxy"
  os_type = "cloud-init"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0 = "ip=192.168.134.100/24,gw=192.168.134.1"
  ciuser = var.user
  cipassword = var.password
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  disk {
    type = "scsi"
    size = "8G"
    slot = 0
    format = "qcow2"
    storage = "local-lvm"
    backup = 1
  }
}
