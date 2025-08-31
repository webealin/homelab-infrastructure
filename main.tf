# main.tf

data "local_file" "ssh_public_key" {
  filename = pathexpand("~/.ssh/fido_gpg2.pub")
}

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
    svcansible_ssh_key        = data.local_file.ssh_public_key.content,
  }

  vms = {
    "sldocker01h" = { ip_address = "192.168.178.11", cpu_cores = 4, memory = 4096, data_disk_size = 30 }
    "sldocker02h" = { ip_address = "192.168.178.12", cpu_cores = 4, memory = 4096, data_disk_size = 30 }
  }
}

# create template, cloud image and user data only once
module "debian_13_template" {
  source = "./modules/debian-13-vm"

  # template specific flags
  is_template        = true
  create_cloud_image = true
  create_user_data   = true

  # template specific config
  vm_name   = "debian-13-template"
  cpu_cores = 2
  memory    = 2048
  disk_size = 10

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
