resource "proxmox_vm_qemu" "docker" {
  name = "remote-docker"
  target_node = "proxmox"
  vmid = 110
  desc = "Docker remote build server."
  onboot = true
  boot = "order=scsi0"
  agent = 1
  clone = var.proxmox_cloud_init_template
  full_clone = true
  memory = 16384
  balloon = 0
  sockets = 1
  cores = 4
  hotplug = "disk,network,usb"
  scsihw = "virtio-scsi-pci"
  tags = "docker, build"
  os_type = "cloud-init"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0 = "ip=192.168.134.110/24,gw=192.168.134.1"
  ciuser = var.ssh_user
  cipassword = var.ssh_password
  sshkeys = var.ssh_pub_keys
  network {
    model = "virtio"
    bridge = "vmbr0"
    macaddr = "00:00:C0:A8:86:6E"
  }
  disk {
    type = "scsi"
    size = "64G"
    slot = 0
    format = "qcow2"
    storage = "local-lvm"
    backup = 1
  }
}

