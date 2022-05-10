module "avalanche" {
  source     = "github.com/status-im/infra-tf-digital-ocean"
  host_count = 3
  env        = "avalanche"
  group      = "avalanche"
  type       = "s-2vcpu-2gb"
  domain     = var.domain

  open_tcp_ports = ["80", "443", "9653", "9655"]
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

resource "cloudflare_record" "explorerapi" {
  zone_id = local.zones["status.im"]
  name    = "avax-explorerapi.infra"
  type    = "A"
  proxied = false
  value   = module.avalanche.public_ips[2]
}

resource "cloudflare_record" "explorer" {
  zone_id = local.zones["status.im"]
  name    = "avax-explorer.infra"
  type    = "A"
  proxied = false
  value   = module.avalanche.public_ips[2]
}

resource "cloudflare_record" "api" {
  zone_id = local.zones["status.im"]
  name    = "avax-api.infra"
  type    = "A"
  proxied = false
  value   = module.avalanche.public_ips[2]
}
