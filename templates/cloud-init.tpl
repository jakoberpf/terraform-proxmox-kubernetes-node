#cloud-config

users:
  - name: kubespray
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh_authorized_keys:
     - ${ssh_key}

packages:
  - qemu-guest-agent
  - curl

runcmd:
  - systemctl start qemu-guest-agent
  # Hosts
  # - echo "127.0.0.1  kube-node.internal" >> /etc/hosts
  # Setup Zerotier
  - curl -o zerotier-install.sh https://raw.githubusercontent.com/jakoberpf/zerotier-scripts/main/zerotier-installer.sh
  - chmod +x zerotier-install.sh
  - ./zerotier-install.sh
  - curl -o zerotier-join.sh https://raw.githubusercontent.com/jakoberpf/zerotier-scripts/main/zerotier-join.sh
  - chmod +x zerotier-join.sh
  - ZTNETWORK=${zerotier_network_id} ./zerotier-join.sh && rm ./zerotier-join.sh

write_files:
  # Zerotier
  - path: /var/lib/zerotier-one/identity.public
    content: |
      ${zerotier_public_key}

  - path: /var/lib/zerotier-one/identity.secret
    content: |
      ${zerotier_private_key}
