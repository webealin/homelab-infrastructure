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
| [proxmox_virtual_environment_role.terraform_role](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_role) | resource |
| [proxmox_virtual_environment_user.terraform_user](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_user) | resource |
| [proxmox_virtual_environment_user_token.terraform_token](https://registry.terraform.io/providers/bpg/proxmox/0.84.1/docs/resources/virtual_environment_user_token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_terraform_role_id"></a> [terraform\_role\_id](#input\_terraform\_role\_id) | Terraform Role ID | `string` | `"Terraform"` | no |
| <a name="input_terraform_token_comment"></a> [terraform\_token\_comment](#input\_terraform\_token\_comment) | Comment for Terraform Token | `string` | `"Terraform Access Token"` | no |
| <a name="input_terraform_token_expiration"></a> [terraform\_token\_expiration](#input\_terraform\_token\_expiration) | Terraform Token Expiration Date | `string` | `"2035-01-01T00:00:00Z"` | no |
| <a name="input_terraform_token_name"></a> [terraform\_token\_name](#input\_terraform\_token\_name) | Name of Terraform Token | `string` | `"terraform"` | no |
| <a name="input_terraform_user_comment"></a> [terraform\_user\_comment](#input\_terraform\_user\_comment) | Comment for Terraform User | `string` | `"Terraform Service Account"` | no |
| <a name="input_terraform_username"></a> [terraform\_username](#input\_terraform\_username) | Name of Terraform User | `string` | `"svcterraform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_terraform_role_id"></a> [terraform\_role\_id](#output\_terraform\_role\_id) | Terraform Role ID |
| <a name="output_terraform_token_id"></a> [terraform\_token\_id](#output\_terraform\_token\_id) | Terraform Token ID |
| <a name="output_terraform_token_value"></a> [terraform\_token\_value](#output\_terraform\_token\_value) | Terraform Token value |
| <a name="output_terraform_user_id"></a> [terraform\_user\_id](#output\_terraform\_user\_id) | Terraform User ID |
<!-- END_TF_DOCS -->
