resource "zerotier_identity" "this" {
}

resource "zerotier_member" "this" {
  name        = "${var.compartment}-${var.name}-${random_string.deployment_id.result}"
  member_id   = zerotier_identity.this.id
  network_id  = var.zerotier_network_id
  ip_assignments = [
    var.zerotier_ip_assignment
  ]
}
