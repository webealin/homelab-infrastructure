# outputs.tf

output "debian_13_template_outputs" {
  description = "Template ID, name, IP address and FQDN"
  value       = module.debian_13_template
}

output "debian_13_vm_outputs" {
  description = "VM ID, name, IP address and FQDN"
  value       = module.debian_13_vm
}
