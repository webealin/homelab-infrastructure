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
| [proxmox_virtual_environment_download_file.debian_13_cloud_image](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_download_file) | resource |
| [proxmox_virtual_environment_file.meta_data_config](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_file.user_data_config](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_vm.debian_13_vm](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_vm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_image_id"></a> [cloud\_image\_id](#input\_cloud\_image\_id) | Existing cloud image ID to use instead of inheritance | `string` | `null` | no |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | Number of CPU cores | `number` | `2` | no |
| <a name="input_create_cloud_image"></a> [create\_cloud\_image](#input\_create\_cloud\_image) | Whether to create / download the cloud image | `bool` | `false` | no |
| <a name="input_create_user_data"></a> [create\_user\_data](#input\_create\_user\_data) | Whether to create the user\_data config | `bool` | `false` | no |
| <a name="input_data_datastore_id"></a> [data\_datastore\_id](#input\_data\_datastore\_id) | Datastore id to store additional data disk on | `string` | `null` | no |
| <a name="input_data_disk_size"></a> [data\_disk\_size](#input\_data\_disk\_size) | Size of additional data disk in GB | `number` | `null` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | OS Disk size in GB | `number` | `8` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS servers | `list(string)` | <pre>[<br/>  "192.168.178.1"<br/>]</pre> | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name | `string` | `"example.com"` | no |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | Network gateway | `string` | `"192.168.178.1"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | IP address for the VM (null for templates) | `string` | `null` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | Whether this is a template | `bool` | `false` | no |
| <a name="input_local_admin_password_hash"></a> [local\_admin\_password\_hash](#input\_local\_admin\_password\_hash) | Admin password hash | `string` | n/a | yes |
| <a name="input_locale"></a> [locale](#input\_locale) | System locale | `string` | `"de_DE.UTF-8"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | RAM in MB | `number` | `2048` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | Network CIDR (e.g. 24) | `number` | `24` | no |
| <a name="input_pve_host"></a> [pve\_host](#input\_pve\_host) | Proxmox host name | `string` | n/a | yes |
| <a name="input_root_password_hash"></a> [root\_password\_hash](#input\_root\_password\_hash) | Root password hash | `string` | n/a | yes |
| <a name="input_svcansible_password_hash"></a> [svcansible\_password\_hash](#input\_svcansible\_password\_hash) | Ansible service account password hash | `string` | n/a | yes |
| <a name="input_svcansible_ssh_key"></a> [svcansible\_ssh\_key](#input\_svcansible\_ssh\_key) | Ansible service account SSH public key | `string` | n/a | yes |
| <a name="input_template_vm_id"></a> [template\_vm\_id](#input\_template\_vm\_id) | Existing template VM ID to clone from | `number` | `null` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | System timezone | `string` | `"Europe/Berlin"` | no |
| <a name="input_user_data_file_id"></a> [user\_data\_file\_id](#input\_user\_data\_file\_id) | Existing user\_data file ID to use | `string` | `null` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the VM | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_image_id"></a> [cloud\_image\_id](#output\_cloud\_image\_id) | Cloud image ID (if created) |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The VM / Template FQDN |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The VM / Template IP address |
| <a name="output_user_data_file_id"></a> [user\_data\_file\_id](#output\_user\_data\_file\_id) | User data file ID (if created) |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | The VM / Template ID |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | The VM / Template name |
<!-- END_TF_DOCS -->
