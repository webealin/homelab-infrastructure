# homelab-infrastructure
This repo contains all infrastructure code for my homelab (OpenTofu)

### Table of Contents
1. [Usage](#usage)
2. [Requirements](#requirements)
3. [Providers](#Providers)
4. [Inputs](#inputs)
5. [Outputs](#outputs)

## Usage

* various commands

pre-commit operates as a git hook, commits triggering a set of tools to check your code. You can set what tools to use to scan your local repository using a configuration file. If a tool finds any errors, for example a misconfiguration of a coding language, it will stop the commit from happening. This is a shift left approach that will improve security and best practices in coding.

Pre-commit hooks are essential scripts that automatically execute before committing your code changes. They serve a critical role in identifying various types of issues, including linting errors, security vulnerabilities, and formatting inconsistencies. This robust pre-commit process ensures the highest quality and safety of your code, making it ready for deployment.


terraform_docs - This tool auto-generates readme files containing information on modules, providers and resources that gives users an easy-to-read and central page that can be digested faster than reading the code.
terraform-docs: This hook meticulously inspects your Terraform configuration files, detecting and correcting documentation errors.

terraform fmt - Terraform format will structure your config files so it presents cleanly.
Terraform Fmt: A Terraform command that is available natively and is used to rewrite Terraform configuration files to a canonical format and style. This command applies a subset of the Terraform language style conventions, along with other minor adjustments for readability.

terraform validate - Terraform validate will check to ensure the configuration is correct based on HCL.
Terraform Validate: A native Terraform command that validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.

tflint - TFLint will check for errors and encourage best practices.
tflint: With this hook, your Terraform configurations undergo a thorough linting process to identify and rectify errors.

tfsec - TFSec reviews the config files for any security concerns based on best practices and reports to the user how to change them to resolve the error.
tfsec: Ensuring security is paramount, and tfsec specializes in scanning Terraform configurations for potential vulnerabilities.

checkov: This hook evaluates your Terraform configurations against a predefined set of security best practices, ensuring robust security posture.
terrascan: Compliance with security standards is vital, and terrascan evaluates your configurations for adherence to these standards.
infracost: Providing financial insights, this hook estimates the cost implications of running your Terraform configurations.
tfupdate: Stay up-to-date with Terraform providers by using this hook to check for updates and improvements.
minamijoyo/hcledit: Code readability and maintainability are enhanced with this hook, which refines your Terraform configurations.
jq: A versatile command-line JSON processor, jq is used to manipulate and refine Terraform configuration files as needed.
Terragrunt: A thin wrapper that provides extra tools for keeping your configurations DRY, working with multiple Terraform modules, and managing remote state.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= v1.10.5 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.3 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.82.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_debian_13_template"></a> [debian\_13\_template](#module\_debian\_13\_template) | ./modules/debian-13-vm | n/a |
| <a name="module_debian_13_vm"></a> [debian\_13\_vm](#module\_debian\_13\_vm) | ./modules/debian-13-vm | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.ssh_public_key](https://registry.terraform.io/providers/hashicorp/local/2.5.3/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS servers | `list(string)` | <pre>[<br/>  "192.168.178.1"<br/>]</pre> | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name | `string` | `"example.com"` | no |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | Network gateway | `string` | `"192.168.178.1"` | no |
| <a name="input_local_admin_password_hash"></a> [local\_admin\_password\_hash](#input\_local\_admin\_password\_hash) | Admin password hash | `string` | n/a | yes |
| <a name="input_locale"></a> [locale](#input\_locale) | System locale | `string` | `"de_DE.UTF-8"` | no |
| <a name="input_pve_endpoint"></a> [pve\_endpoint](#input\_pve\_endpoint) | API Endpoint for Proxmox Virtual Environment | `string` | `"https://192.168.178.31:8006"` | no |
| <a name="input_pve_host"></a> [pve\_host](#input\_pve\_host) | Proxmox host name | `string` | `"odin"` | no |
| <a name="input_pve_password"></a> [pve\_password](#input\_pve\_password) | Password used to login to PVE API | `string` | n/a | yes |
| <a name="input_pve_username"></a> [pve\_username](#input\_pve\_username) | Username used to login to PVE API | `string` | `"root@pam"` | no |
| <a name="input_root_password_hash"></a> [root\_password\_hash](#input\_root\_password\_hash) | Root password hash | `string` | n/a | yes |
| <a name="input_svcansible_password_hash"></a> [svcansible\_password\_hash](#input\_svcansible\_password\_hash) | Ansible service account password hash | `string` | n/a | yes |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | System timezone | `string` | `"Europe/Berlin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_debian_13_template_outputs"></a> [debian\_13\_template\_outputs](#output\_debian\_13\_template\_outputs) | n/a |
| <a name="output_debian_13_vm_outputs"></a> [debian\_13\_vm\_outputs](#output\_debian\_13\_vm\_outputs) | n/a |
<!-- END_TF_DOCS -->
