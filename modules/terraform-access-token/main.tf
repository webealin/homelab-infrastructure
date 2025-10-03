# modules/terraform-access-token/main.tf

# create terraform role
resource "proxmox_virtual_environment_role" "terraform_role" {
  role_id = var.terraform_role_id

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
  comment = var.terraform_user_comment
  user_id = "${var.terraform_username}@pve"
}

# create terraform access token
resource "proxmox_virtual_environment_user_token" "terraform_token" {
  comment               = var.terraform_token_comment
  expiration_date       = var.terraform_token_expiration
  token_name            = var.terraform_token_name
  user_id               = proxmox_virtual_environment_user.terraform_user.user_id
  privileges_separation = false
}
