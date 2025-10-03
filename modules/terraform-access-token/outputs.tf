# modules/terraform-access-token/outputs.tf

output "terraform_role_id" {
  description = "Terraform Role ID"
  value       = proxmox_virtual_environment_role.terraform_role.role_id
}

output "terraform_user_id" {
  description = "Terraform User ID"
  value       = proxmox_virtual_environment_user.terraform_user.user_id
}

output "terraform_token_id" {
  description = "Terraform Token ID"
  value       = proxmox_virtual_environment_user_token.terraform_token.id
}

output "terraform_token_value" {
  description = "Terraform Token value"
  value       = proxmox_virtual_environment_user_token.terraform_token.value
  sensitive   = true
}
