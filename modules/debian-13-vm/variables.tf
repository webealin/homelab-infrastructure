# modules/debian-13-vm/variables.tf

# Resource Flags
variable "create_cloud_image" {
  description = "Whether to create / download the cloud image"
  type        = bool
  default     = false
}
variable "create_user_data" {
  description = "Whether to create the user_data config"
  type        = bool
  default     = false
}
variable "cloud_image_id" {
  description = "Existing cloud image ID to use instead of inheritance"
  type        = string
  default     = null
}
variable "user_data_file_id" {
  description = "Existing user_data file ID to use"
  type        = string
  default     = null
}

# Template specific variables
variable "is_template" {
  description = "Whether this is a template"
  type        = bool
  default     = false
}
variable "template_vm_id" {
  description = "Existing template VM ID to clone from"
  type        = number
  default     = null
}

# VM specific variables
variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "pve_host" {
  description = "Proxmox host name"
  type        = string
}

variable "ip_address" {
  description = "IP address for the VM (null for templates)"
  type        = string
  default     = null
}

variable "network_cidr" {
  description = "Network CIDR (e.g. 24)"
  type        = number
  default     = 24
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "RAM in MB"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "OS Disk size in GB"
  type        = number
  default     = 8
}
variable "data_disk_size" {
  description = "Size of additional data disk in GB"
  type        = number
  default     = null
}
variable "data_datastore_id" {
  description = "Datastore id to store additional data disk on"
  type        = string
  default     = null
}

# Globals
variable "domain" {
  description = "Domain name"
  type        = string
  default     = "example.com"
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
  description = "Ansible service account SSH public key"
  type        = string
}
variable "local_admin_password_hash" {
  description = "Admin password hash"
  type        = string
  sensitive   = true
}
