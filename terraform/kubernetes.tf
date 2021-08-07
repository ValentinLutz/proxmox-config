locals {
  masters = {
    alpha = {
      vmid = 120
    },
    beta = {
      vmid = 121
    },
    gamma = {
      vmid = 122
    }
  }
  workers = {
    vega = {
      vmid = 130
    },
    polaris = {
      vmid = 131
    },
    rigel = {
      vmid = 132
    }
  }
}

resource "proxmox_vm_qemu" "load-balancer" {
  name = "k8s-load-balancer"
  target_node = "proxmox"
  vmid = 115
  desc = "Load balancer for kubernetes high availability setup."
  onboot = true
  boot = "order=scsi0"
  agent = 1
  clone = var.proxmox_cloud_init_template
  full_clone = true
  memory = 2048
  balloon = 0
  sockets = 1
  cores = 2
  hotplug = "disk,network,usb"
  scsihw = "virtio-scsi-pci"
  tags = "k8s, kubernetes, load-balancer"
  os_type = "cloud-init"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0 = "ip=192.168.134.115/24,gw=192.168.134.1"
  ciuser = var.ssh_user
  cipassword = var.ssh_password
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

resource "proxmox_vm_qemu" "master" {
  for_each = local.masters

  name = "k8s-master-${each.key}"
  target_node = "proxmox"
  vmid = each.value.vmid
  desc = "Master node for kubernetes high availability setup."
  onboot = true
  boot = "order=scsi0"
  agent = 1
  clone = var.proxmox_cloud_init_template
  full_clone = true
  memory = 2048
  balloon = 0
  sockets = 1
  cores = 2
  hotplug = "disk,network,usb"
  scsihw = "virtio-scsi-pci"
  tags = "k8s, kubernetes, master"
  os_type = "cloud-init"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0 = "ip=192.168.134.${each.value.vmid}/24,gw=192.168.134.1"
  ciuser = var.ssh_user
  cipassword = var.ssh_password
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  disk {
    type = "scsi"
    size = "8G"
    slot = 0
    storage = "local-lvm"
    backup = 1
  }
}

resource "proxmox_vm_qemu" "worker" {
  for_each = local.workers

  name = "k8s-worker-${each.key}"
  target_node = "proxmox"
  vmid = each.value.vmid
  desc = "Worker node for kubernetes high availability setup."
  onboot = true
  boot = "order=scsi0"
  agent = 1
  clone = var.proxmox_cloud_init_template
  full_clone = true
  memory = 4096
  balloon = 0
  sockets = 1
  cores = 2
  hotplug = "disk,network,usb"
  scsihw = "virtio-scsi-pci"
  tags = "k8s, kubernetes, master"
  os_type = "cloud-init"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0 = "ip=192.168.134.${each.value.vmid}/24,gw=192.168.134.1"
  ciuser = var.ssh_user
  cipassword = var.ssh_password
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  disk {
    type = "scsi"
    size = "8G"
    slot = 0
    storage = "local-lvm"
    backup = 1
  }
}
