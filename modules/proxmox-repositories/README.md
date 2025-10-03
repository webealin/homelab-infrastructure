<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= v1.10.5 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.84.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.84.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_apt_repository.ceph_squid_enterprise](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_apt_repository) | resource |
| [proxmox_virtual_environment_apt_repository.ceph_squid_no_subscription](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_apt_repository) | resource |
| [proxmox_virtual_environment_apt_repository.pve_enterprise](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_apt_repository) | resource |
| [proxmox_virtual_environment_apt_repository.pve_no_subscription](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_apt_repository) | resource |
| [proxmox_virtual_environment_apt_standard_repository.ceph_squid_no_subscription](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_apt_standard_repository) | resource |
| [proxmox_virtual_environment_apt_standard_repository.pve_no_subscription](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_apt_standard_repository) | resource |
| [proxmox_virtual_environment_apt_standard_repository.ceph_squid_enterprise](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/data-sources/virtual_environment_apt_standard_repository) | data source |
| [proxmox_virtual_environment_apt_standard_repository.pve_enterprise](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/data-sources/virtual_environment_apt_standard_repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pve_node"></a> [pve\_node](#input\_pve\_node) | Proxmox node name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_status"></a> [status](#output\_status) | The status of all repositories on the node |
<!-- END_TF_DOCS -->
