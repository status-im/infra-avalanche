module "avalanche" {
  source     = "github.com/status-im/infra-tf-digital-ocean"
  host_count = 3
  env        = "avalanche"
  group      = "avalanche"
  size       = "s-2vcpu-2gb"
  domain     = var.domain

  open_tcp_ports = ["9653"]
}
