data "template_file" "cloud_init" {
  template = file("${path.module}/templates/cloud-init.tpl")

  vars = {
    ssh_key              = var.ssh_authorized_keys
    zerotier_network_id  = var.zerotier_network_id
    zerotier_public_key  = zerotier_identity.this.public_key
    zerotier_private_key = zerotier_identity.this.private_key
  }
}

resource "remote_file" "cloud_init" {
  path    = "/var/lib/vz/snippets/cloud-init-kubernetes-node-${random_string.deployment_id.result}.yml"
  content = data.template_file.cloud_init.rendered
}
