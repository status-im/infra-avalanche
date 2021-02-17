/* DATA -----------------------------------------*/

terraform {
  backend "consul" {
    address = "https://consul.statusim.net:8400"
    lock = true /* Lock to avoid syncing issues */
    gzip = true /* KV store has a limit of 512KB */
    /* WARNING This needs to be changed for every repo. */
    path      = "terraform/avalanche/"
    ca_file   = "ansible/files/consul-ca.crt"
    cert_file = "ansible/files/consul-client.crt"
    key_file  = "ansible/files/consul-client.key"
  }
}
