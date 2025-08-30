# providers.tf
provider "proxmox" {
  endpoint = var.pve_endpoint
  username = var.pve_username
  password = var.pve_password
  # because self-signed TLS ceritificate is in use (for now)
  insecure = true
}
