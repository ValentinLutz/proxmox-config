terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.7.4"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://proxmox:8006/api2/json"
  pm_tls_insecure = true
  pm_parallel = 1
  # pm_user = ENV PM_USER
  # pm_password = ENV PM_PASSWORD
}

# ENV TF_VAR_user
variable "user" {
  type = string
}

# ENV TF_VAR_password
variable "password" {
  type = string
}