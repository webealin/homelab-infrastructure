# providers.tf

provider "proxmox" {
  endpoint = var.pve_endpoint

  # because self-signed TLS ceritificate is in use (for now)
  insecure = true

  # username & password credentials
  username = var.pve_username
  password = var.pve_password

  # api token credentials
  api_token = var.pve_api_token

  ssh {
    agent       = false
    username    = var.pve_username
    private_key = fileexists(var.pve_ssh_key) ? file(var.pve_ssh_key) : null
    node {
      name    = var.pve_host
      address = "${var.pve_host}.${var.domain}"
      port    = var.pve_ssh_port
    }
  }
}
