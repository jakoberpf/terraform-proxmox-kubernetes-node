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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.14 |
| <a name="requirement_remote"></a> [remote](#requirement\_remote) | 0.0.23 |
| <a name="requirement_zerotier"></a> [zerotier](#requirement\_zerotier) | 1.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.14 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_remote"></a> [remote](#provider\_remote) | 0.0.23 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_zerotier"></a> [zerotier](#provider\_zerotier) | 1.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_vm_qemu.this](https://registry.terraform.io/providers/telmate/proxmox/2.9.14/docs/resources/vm_qemu) | resource |
| [random_id.argo_tunnel_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_string.deployment_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [remote_file.cloud_init](https://registry.terraform.io/providers/tenstad/remote/0.0.23/docs/resources/file) | resource |
| [zerotier_identity.this](https://registry.terraform.io/providers/zerotier/zerotier/1.2.0/docs/resources/identity) | resource |
| [zerotier_member.this](https://registry.terraform.io/providers/zerotier/zerotier/1.2.0/docs/resources/member) | resource |
| [template_file.cloud_init](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_id"></a> [id](#input\_id) | n/a | `number` | `100` | no |
| <a name="input_instance_cpus"></a> [instance\_cpus](#input\_instance\_cpus) | n/a | `string` | `2` | no |
| <a name="input_instance_disk_backend"></a> [instance\_disk\_backend](#input\_instance\_disk\_backend) | n/a | `string` | `"local-lvm"` | no |
| <a name="input_instance_disk_size"></a> [instance\_disk\_size](#input\_instance\_disk\_size) | n/a | `string` | `"19660M"` | no |
| <a name="input_instance_memory"></a> [instance\_memory](#input\_instance\_memory) | n/a | `number` | `8000` | no |
| <a name="input_instance_template"></a> [instance\_template](#input\_instance\_template) | n/a | `string` | `"ubuntu-focal-server-cloudinit"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_gateway"></a> [network\_gateway](#input\_network\_gateway) | n/a | `string` | n/a | yes |
| <a name="input_network_ip"></a> [network\_ip](#input\_network\_ip) | n/a | `string` | n/a | yes |
| <a name="input_node"></a> [node](#input\_node) | n/a | `string` | n/a | yes |
| <a name="input_ssh_authorized_keys"></a> [ssh\_authorized\_keys](#input\_ssh\_authorized\_keys) | n/a | `string` | n/a | yes |
| <a name="input_zerotier_ip_assignment"></a> [zerotier\_ip\_assignment](#input\_zerotier\_ip\_assignment) | n/a | `string` | n/a | yes |
| <a name="input_zerotier_network_id"></a> [zerotier\_network\_id](#input\_zerotier\_network\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip"></a> [ip](#output\_ip) | n/a |
| <a name="output_ip_zerotier"></a> [ip\_zerotier](#output\_ip\_zerotier) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->