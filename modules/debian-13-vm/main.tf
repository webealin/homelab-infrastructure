# modules/debian-13-vm/main.tf

# Cloud Image (uploaded once)
resource "proxmox_virtual_environment_download_file" "debian_13_cloud_image" {
  count = var.create_cloud_image ? 1 : 0

  content_type       = "import"
  datastore_id       = "local"
  node_name          = var.pve_host
  file_name          = "debian-13-generic-amd64-20250814-2204.qcow2"
  url                = "https://cloud.debian.org/images/cloud/trixie/20250814-2204/debian-13-generic-amd64-20250814-2204.qcow2"
  checksum           = "8f5c54d654b53951430b404efc3043b425cf2214467d5bf33d6c5157fa47c8fe4a1a2abf603050dafc7e54f57e9685f0d59a6c0d09d0cb2b7fcec75561c0df6f"
  checksum_algorithm = "sha512"
}

# Cloud-Init User-Data config (uploaded once)
resource "proxmox_virtual_environment_file" "user_data_config" {
  count = var.create_user_data ? 1 : 0

  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.pve_host

  source_raw {
    data = templatefile("${path.module}/resources/cloud-init/debian_13_user_data.yml.tpl", {
      domain                    = var.domain,
      timezone                  = var.timezone,
      locale                    = var.locale,
      root_password_hash        = var.root_password_hash,
      svcansible_password_hash  = var.svcansible_password_hash,
      svcansible_ssh_key        = var.svcansible_ssh_key,
      local_admin_password_hash = var.local_admin_password_hash,
      keyboard_layout           = split("_", var.locale)[0]
    })
    file_name = "debian_13_user_data.yml"
  }
}

# Cloud-Init Meta-Data config (uploaded once per VM)
resource "proxmox_virtual_environment_file" "meta_data_config" {
  count = var.is_template ? 0 : 1

  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.pve_host

  source_raw {
    data      = <<-EOF
    instance-id: ${var.vm_name}
    local-hostname: ${var.vm_name}
    EOF
    file_name = "meta_data_${var.vm_name}.yml"
  }
}

# Debian 13 VM / Template
resource "proxmox_virtual_environment_vm" "debian_13_vm" {
  name            = var.vm_name
  node_name       = var.pve_host
  template        = var.is_template
  keyboard_layout = split("_", var.locale)[0]

  # ignore changes for IP addresses and NICs as they are managed by PVE
  # This is a known provider bug (#1494, #1712, #1788)
  lifecycle {
    ignore_changes = [
      ipv4_addresses,
      ipv6_addresses,
      network_interface_names
    ]
  }

  # this is either a template or a clone
  dynamic "clone" {
    for_each = var.template_vm_id != null ? [1] : []
    content {
      vm_id = var.template_vm_id
    }
  }

  # CPU & Memory
  cpu {
    cores = var.cpu_cores
  }
  memory {
    dedicated = var.memory
  }
  # OS Disk
  # this is either a cloud image or the inherited template image
  disk {
    datastore_id = "local-lvm"
    import_from  = var.template_vm_id == null ? (var.create_cloud_image ? proxmox_virtual_environment_download_file.debian_13_cloud_image[0].id : var.cloud_image_id) : null
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }
  # Data Disk
  dynamic "disk" {
    for_each = !var.is_template && var.data_disk_size != null ? [1] : []
    content {
      datastore_id = var.data_datastore_id != null ? var.data_datastore_id : "local-lvm"
      interface    = "virtio1"
      iothread     = true
      discard      = "on"
      size         = var.data_disk_size
    }
  }
  # Network Interface
  network_device {
    bridge = "vmbr0"
  }

  # PVE Guest Agent
  stop_on_destroy = false
  agent {
    enabled = true
  }

  # Cloud-Init
  initialization {
    datastore_id = "local-lvm"
    dynamic "ip_config" {
      for_each = var.is_template ? [] : [1]
      content {
        ipv4 {
          address = "${var.ip_address}/${var.network_cidr}"
          gateway = var.gateway
        }
      }
    }
    dns {
      domain  = var.domain
      servers = var.dns_servers
    }
    user_data_file_id = var.create_user_data ? proxmox_virtual_environment_file.user_data_config[0].id : var.user_data_file_id
    meta_data_file_id = var.is_template ? null : proxmox_virtual_environment_file.meta_data_config[0].id
  }
}
