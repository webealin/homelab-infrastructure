# modules/proxmox-repositories/outputs.tf

output "status" {
  description = "The status of all repositories on the node"
  value = {
    node                       = var.pve_node
    pve_enterprise             = proxmox_virtual_environment_apt_repository.pve_enterprise.enabled
    pve_no_subscription        = proxmox_virtual_environment_apt_repository.pve_no_subscription.enabled
    ceph_squid_enterprise      = proxmox_virtual_environment_apt_repository.ceph_squid_enterprise.enabled
    ceph_squid_no_subscription = proxmox_virtual_environment_apt_repository.ceph_squid_no_subscription.enabled
  }
}
