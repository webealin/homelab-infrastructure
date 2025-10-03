# modules/proxmox-repositories/main.tf

data "proxmox_virtual_environment_apt_standard_repository" "pve_enterprise" {
  handle = "enterprise"
  node   = var.pve_node
}

data "proxmox_virtual_environment_apt_standard_repository" "ceph_squid_enterprise" {
  handle = "ceph-squid-enterprise"
  node   = var.pve_node
}

# create the no-subscription standard repository
resource "proxmox_virtual_environment_apt_standard_repository" "pve_no_subscription" {
  handle = "no-subscription"
  node   = var.pve_node
}

# create the ceph-squid-no-subscription standard repository
resource "proxmox_virtual_environment_apt_standard_repository" "ceph_squid_no_subscription" {
  handle = "ceph-squid-no-subscription"
  node   = var.pve_node
}

# caution: this resource already exists, so import this one first!
resource "proxmox_virtual_environment_apt_repository" "pve_enterprise" {
  enabled   = false
  file_path = "/etc/apt/sources.list.d/pve-enterprise.sources"
  index     = coalesce(data.proxmox_virtual_environment_apt_standard_repository.pve_enterprise.index, 0)
  node      = data.proxmox_virtual_environment_apt_standard_repository.pve_enterprise.node
}

# caution: this resource already exists, so import this one first!
resource "proxmox_virtual_environment_apt_repository" "ceph_squid_enterprise" {
  enabled   = false
  file_path = "/etc/apt/sources.list.d/ceph.sources"
  index     = coalesce(data.proxmox_virtual_environment_apt_standard_repository.ceph_squid_enterprise.index, 0)
  node      = data.proxmox_virtual_environment_apt_standard_repository.ceph_squid_enterprise.node
}

# caution: this resource exists automatically after creation of the standard apt repository
resource "proxmox_virtual_environment_apt_repository" "pve_no_subscription" {
  enabled   = true
  file_path = "/etc/apt/sources.list.d/proxmox.sources"
  index     = coalesce(proxmox_virtual_environment_apt_standard_repository.pve_no_subscription.index, 0)
  node      = proxmox_virtual_environment_apt_standard_repository.pve_no_subscription.node
}

# caution: this resource exists automatically after creation of the standard apt repository
resource "proxmox_virtual_environment_apt_repository" "ceph_squid_no_subscription" {
  enabled   = true
  file_path = "/etc/apt/sources.list.d/ceph.sources"
  index     = coalesce(proxmox_virtual_environment_apt_standard_repository.ceph_squid_no_subscription.index, 1)
  node      = var.pve_node
}
