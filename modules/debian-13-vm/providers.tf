# modules/debian-13-vm/providers.tf

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.82.1"
    }
  }
  required_version = ">= v1.10.5"
}
