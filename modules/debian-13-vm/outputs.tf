# modules/debian-13-vm/outputs.tf

output "vm_id" {
  description = "The VM / Template ID"
  value       = proxmox_virtual_environment_vm.debian_13_vm.id
}

output "vm_name" {
  description = "The VM / Template name"
  value       = proxmox_virtual_environment_vm.debian_13_vm.name
}

output "ip_address" {
  description = "The VM / Template IP address"
  value       = var.ip_address
}

output "fqdn" {
  description = "The VM / Template FQDN"
  value       = "${var.vm_name}.${var.domain}"
}

output "cloud_image_id" {
  description = "Cloud image ID (if created)"
  value       = var.create_cloud_image ? proxmox_virtual_environment_download_file.debian_13_cloud_image[0].id : null
}

output "user_data_file_id" {
  description = "User data file ID (if created)"
  value       = var.create_user_data ? proxmox_virtual_environment_file.user_data_config[0].id : null
}
