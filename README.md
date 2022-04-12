# Proxmox Kubernetes Virtual Machine

This module provisions a Proxmox Virtual Machine, for a Kubernetes Cluster.

```hcl
module "kubernetes_node" {
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-instance"
  providers = {
    proxmox  = proxmox
    remote   = remote.proxmox
    zerotier = zerotier
  }

  id                     = 100
  name                   = "kubernetes"
  compartment            = "development"
  node                   = "dev"
  instance_template      = "ubuntu-focal-cloudinit"
  instance_cpus          = 4
  instance_memory        = 16384
  instance_disk_backend  = "local-zfs"
  network_ip             = "192.168.0.10/24"
  network_gateway        = "192.168.0.1"
  ssh_secret_key         = file("../.ssh/automation")
  ssh_authorized_keys    = var.authorized_keys
  zerotier_network_id    = var.zerotier_network_id_development
  zerotier_ip_assignment = "10.147.19.110"
}
```
