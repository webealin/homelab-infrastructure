#cloud-config

# basic system setup
locale: ${locale}
keyboard:
  layout: ${keyboard_layout}
timezone: ${timezone}

# install the guest agent and console-setup for the keyboard layout
package_update: true
package_upgrade: true
packages:
  - console-setup
  - qemu-guest-agent

# user setup configuration
users:
  - name: svcansible
    gecos: Ansible Service Account
    sudo: ['ALL=(ALL) ALL']
    lock_passwd: false
    passwd: ${svcansible_password_hash}
    shell: /bin/bash
    ssh_authorized_keys:
      - ${svcansible_ssh_key}
  - name: lla
    gecos: Local Linux Admin
    sudo: ['ALL=(ALL) ALL']
    lock_passwd: false
    passwd: ${local_admin_password_hash}
    shell: /bin/bash

# change the root users password
chpasswd:
  users:
    - name: root
      password: ${root_password_hash}
      type: hash
  expire: false

runcmd:
  - systemctl enable --now qemu-guest-agent
  - systemctl start --now qemu-guest-agent

# modify /etc/locale.gen so that de_DE can be set
bootcmd:
  - cloud-init-per once setlocales sed -i '/${locale}/s/^# //' /etc/locale.gen

final_message: "The system is up, after $UPTIME seconds"

# reboot instance after configuration
power_state:
  mode: reboot
  message: Rebooting after initial setup
  timeout: 30
  condition: true
