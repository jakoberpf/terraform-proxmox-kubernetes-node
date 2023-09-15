terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
    remote = {
      source  = "tenstad/remote"
      version = "0.0.23"
    }
    zerotier = {
      source  = "zerotier/zerotier"
      version = "1.2.0"
    }
  }
}

resource "random_string" "deployment_id" {
  length  = 5
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "random_id" "argo_tunnel_secret" {
  byte_length = 35
}
