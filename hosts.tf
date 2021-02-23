module "avalanche" {
  source     = "github.com/status-im/infra-tf-digital-ocean"
  host_count = 3
  env        = "avalanche"
  group      = "avalanche"
  size       = "s-2vcpu-2gb"
  domain     = var.domain

  open_tcp_ports = ["80", "443", "9653"]
}

resource "cloudflare_record" "faucet" {
  zone_id = local.zones["status.im"]
  name    = "avax-faucet.infra"
  type    = "A"
  proxied = false
  value   = module.avalanche.public_ips[0]
}

resource "cloudflare_record" "wallet" {
  zone_id = local.zones["status.im"]
  name    = "avax-wallet.infra"
  type    = "A"
  proxied = false
  value   = module.avalanche.public_ips[1]
}
