# main.tf

locals {
  common_config = {
    pve_host                  = var.pve_host,
    gateway                   = var.gateway,
    dns_servers               = var.dns_servers,
    domain                    = var.domain,
    timezone                  = var.timezone,
    locale                    = var.locale,
    root_password_hash        = var.root_password_hash,
    local_admin_password_hash = var.local_admin_password_hash,
    svcansible_password_hash  = var.svcansible_password_hash,
    svcansible_ssh_key        = var.svcansible_ssh_key,
  }

  vms = {
    "sldocker01h" = { id = 101, ip_address = "192.168.178.11", cpu_cores = 4, memory = 8192, data_disk_size = 30 }
    "sldocker02h" = { id = 102, ip_address = "192.168.178.12", cpu_cores = 2, memory = 4096, data_disk_size = 30 }
  }
}

# create terraform role
resource "proxmox_virtual_environment_role" "terraform_role" {
  role_id = "Terraform"

  # docs: https://pve.proxmox.com/pve-docs/pveum.1.html#_privileges
  privileges = [
    # node / system privileges
    "Mapping.Audit",
    "Mapping.Modify",
    "Mapping.Use",
    "Permissions.Modify",
    "Pool.Allocate",
    "Pool.Audit",
    "SDN.Audit",
    "SDN.Use",
    "Sys.Audit",
    "Sys.Modify",
    "User.Modify",

    # VM privileges
    "VM.Allocate",
    "VM.PowerMgmt",
    "VM.Audit",
    "VM.Clone",
    "VM.Config.CDROM",
    "VM.Config.CPU",
    "VM.Config.Cloudinit",
    "VM.Config.Disk",
    "VM.Config.HWType",
    "VM.Config.Memory",
    "VM.Config.Network",
    "VM.Config.Options",
    "VM.GuestAgent.Audit",
    "VM.Migrate",
    "VM.Replicate",

    # Storage privileges
    "Datastore.Allocate",
    "Datastore.AllocateSpace",
    "Datastore.AllocateTemplate",
    "Datastore.Audit",
  ]
}

# create terraform user
resource "proxmox_virtual_environment_user" "terraform_user" {
  acl {
    path      = "/"
    propagate = true
    role_id   = proxmox_virtual_environment_role.terraform_role.role_id
  }
  comment = "Terraform Service Account"
  user_id = "svcterraform@pve"
}

# create terraform access token
resource "proxmox_virtual_environment_user_token" "terraform_token" {
  comment               = "Terraform Access Token"
  expiration_date       = "2035-01-01T00:00:00Z"
  token_name            = "terraform"
  user_id               = proxmox_virtual_environment_user.terraform_user.user_id
  privileges_separation = false
}

# create template, cloud image and user data only once
module "debian_13_template" {
  source = "./modules/debian-13-vm"

  # template specific flags
  is_template        = true
  create_cloud_image = true
  create_user_data   = true

  # template specific config
  vm_id     = 1000
  vm_name   = "debian-13-template"
  cpu_cores = 2
  memory    = 2048
  disk_size = 8

  # common config
  pve_host                  = local.common_config.pve_host
  gateway                   = local.common_config.gateway
  dns_servers               = local.common_config.dns_servers
  domain                    = local.common_config.domain
  timezone                  = local.common_config.timezone
  locale                    = local.common_config.locale
  root_password_hash        = local.common_config.root_password_hash
  local_admin_password_hash = local.common_config.local_admin_password_hash
  svcansible_password_hash  = local.common_config.svcansible_password_hash
  svcansible_ssh_key        = local.common_config.svcansible_ssh_key
}

module "debian_13_vm" {
  for_each = local.vms
  source   = "./modules/debian-13-vm"

  # VM specific flags
  is_template        = false
  create_cloud_image = false
  create_user_data   = false
  template_vm_id     = module.debian_13_template.vm_id

  # references for shared resources
  cloud_image_id    = module.debian_13_template.cloud_image_id
  user_data_file_id = module.debian_13_template.user_data_file_id

  # VM specific config
  vm_id          = each.value.id
  vm_name        = each.key
  ip_address     = each.value.ip_address
  cpu_cores      = each.value.cpu_cores
  memory         = each.value.memory
  data_disk_size = each.value.data_disk_size

  # common config
  pve_host                  = local.common_config.pve_host
  gateway                   = local.common_config.gateway
  dns_servers               = local.common_config.dns_servers
  domain                    = local.common_config.domain
  timezone                  = local.common_config.timezone
  locale                    = local.common_config.locale
  root_password_hash        = local.common_config.root_password_hash
  local_admin_password_hash = local.common_config.local_admin_password_hash
  svcansible_password_hash  = local.common_config.svcansible_password_hash
  svcansible_ssh_key        = local.common_config.svcansible_ssh_key
}
