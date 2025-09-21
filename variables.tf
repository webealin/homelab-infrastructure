# variables.tf

# PVE provider
variable "pve_endpoint" {
  description = "API Endpoint for Proxmox Virtual Environment"
  type        = string
  default     = "https://192.168.178.31:8006"
}
variable "pve_username" {
  description = "Username used to login to PVE API"
  type        = string
  default     = "root@pam"
}
variable "pve_password" {
  description = "Password used to login to PVE API"
  type        = string
  sensitive   = true
}
# Globals
variable "pve_host" {
  description = "Proxmox host name"
  type        = string
  default     = "odin"
}
variable "domain" {
  description = "Domain name"
  type        = string
  default     = "webernet-online.de"
}
variable "timezone" {
  description = "System timezone"
  type        = string
  default     = "Europe/Berlin"
}
variable "locale" {
  description = "System locale"
  type        = string
  default     = "de_DE.UTF-8"
}
variable "gateway" {
  description = "Network gateway"
  type        = string
  default     = "192.168.178.1"
}
variable "dns_servers" {
  description = "DNS servers"
  type        = list(string)
  default     = ["192.168.178.1"]
}
# Credentials
variable "root_password_hash" {
  description = "Root password hash"
  type        = string
  sensitive   = true
}
variable "svcansible_password_hash" {
  description = "Ansible service account password hash"
  type        = string
  sensitive   = true
}
variable "svcansible_ssh_key" {
  description = "Ansible service account public SSH key"
  type        = string
  sensitive   = true
}
variable "local_admin_password_hash" {
  description = "Admin password hash"
  type        = string
  sensitive   = true
}
