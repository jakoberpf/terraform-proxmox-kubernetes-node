output "name" {
  value = "${var.name}-${random_string.deployment_id.result}"
}

output "ip" {
  value = var.network_ip
}

output "ip_zerotier" {
  value = var.zerotier_ip_assignment
}
