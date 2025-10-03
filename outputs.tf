# outputs.tf

output "proxmox_apt_repositories_output" {
  description = "The status of all repositories on the node"
  value       = module.proxmox_apt_repositories
}

output "terraform_access_token_output" {
  description = "Terraform Role ID, User ID and access token"
  value       = module.terraform_access_token
  sensitive   = true
}

output "debian_13_template_outputs" {
  description = "Template ID, name, IP address and FQDN"
  value       = module.debian_13_template
}

output "debian_13_vm_outputs" {
  description = "VM ID, name, IP address and FQDN"
  value       = module.debian_13_vm
}
