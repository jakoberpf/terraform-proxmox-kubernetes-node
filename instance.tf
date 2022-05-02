resource "proxmox_vm_qemu" "this" {
  depends_on = [
    remote_file.cloud_init
  ]

  name        = "${var.name}-${random_string.deployment_id.result}"
  vmid        = var.id
  target_node = var.node

  clone   = var.instance_template
  os_type = "cloud-init"

  ipconfig0 = "ip=${var.network_ip},gw=${var.network_gateway}"
  cicustom  = "user=local:snippets/cloud-init-kubernetes-node-${random_string.deployment_id.result}.yml"

  memory = var.instance_memory
  cores  = var.instance_cpus
  agent  = 1
  onboot = true

  bootdisk = "virtio0"
  scsihw   = "virtio-scsi-pci"

  disk {
    size    = var.instance_disk_size
    type    = "virtio"
    storage = var.instance_disk_backend
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Ignore changes to the network
  ## MAC address is generated on every apply, causing
  ## TF to think this needs to be rebuilt on every apply
  lifecycle {
    ignore_changes = [
      network
    ]
  }
}
