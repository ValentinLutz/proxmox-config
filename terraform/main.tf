terraform {
  required_version = "1.3.7"
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.134.100:8006/api2/json"
  pm_tls_insecure = true
  pm_parallel = 4
  pm_user = var.proxmox_user
  pm_password = var.proxmox_password
}

# ENV TF_VAR_proxmox_user
variable "proxmox_user" {
  type = string
  sensitive = true
}

# ENV TF_VAR_proxmox_password
variable "proxmox_password" {
  type = string
  sensitive = true
}

variable "proxmox_cloud_init_template" {
  type = string
  default = "ubuntu-2204-cloud-init-template"
}

# ENV TF_VAR_ssh_user
variable "ssh_user" {
  type = string
  sensitive = true
}

# ENV TF_VAR_ssh_password
variable "ssh_password" {
  type = string
  sensitive = true
}

# ENV TF_VAR_ssh_pub_keys
variable "ssh_pub_keys" {
  type = string
  sensitive = true
}
