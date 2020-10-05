resource "digitalocean_domain" "domain_name" {
  name         = var.domain_name
}

resource "digitalocean_record" "scanner_record" {
  count  = var.vm_instances
  domain = digitalocean_domain.domain_name.name
  type   = "A"
  name   = element(digitalocean_droplet.scanner.*.name, count.index)
  value  = element(digitalocean_droplet.scanner.*.ipv4_address, count.index)
}
