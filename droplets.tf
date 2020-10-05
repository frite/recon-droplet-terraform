data "digitalocean_ssh_key" "ssh_key" {
  name = var.do_ssh_key_name
}

resource "digitalocean_droplet" "scanner" {
  count = var.vm_instances
  image  = var.vm_image
  region = var.vm_region
  size = var.vm_size
  private_networking = var.vm_private_networking
  backups = var.vm_backups
  monitoring = var.vm_monitoring
  ipv6 = var.vm_ipv6
  name = "${var.vm_name}-${count.index}"
  tags = var.vm_tags
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key.id
  ]

  provisioner "remote-exec" {
    connection {
      host = digitalocean_droplet.vm[count.index].ipv4_address
      user = var.ssh_user
      type = "ssh"
      timeout = "2m"
      # Uncomment this if pointing to a key 
      # private_key = file(var.ssh_pvt_key_path)
      agent = true
    }

    inline = [
      "export PATH=$PATH:/usr/bin",
      "apt-get update",
      "DEBIAN_FRONTEND=noninteractive apt-get -yq upgrade",
      "DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade",
      "DEBIAN_FRONTEND=noninteractive apt-get -yq autoremove",
      "DEBIAN_FRONTEND=noninteractive apt-get install -yq python"
    ]
  }
}
