# modules/terraform-access-token/providers.tf

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.84.1"
    }
  }
  required_version = ">= v1.10.5"
}
