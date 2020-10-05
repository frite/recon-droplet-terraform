variable "do_token" {}

variable "do_ssh_key_name" {}

/*
* The following values can be left as is
*/

variable "domain_name" {
  default = ""
}

variable "ssh_user" {
  default = "root"
}

variable "ssh_pvt_key_path" {
  default = ""
}

variable "vm_instances" {
  default = 1
}

variable "vm_name" {
  default = "bb-ubuntu-scanner"
}

// Refer to DO documentation for instances and Regions.

variable "vm_image" {
  default = "ubuntu-20-04-x64"
}

variable "vm_region" {
  default = "sfo2"
}

variable "vm_size" {
  default = "s-1vcpu-2gb"
}

variable "vm_private_networking" {
  default = true
}

variable "vm_backups" {
  default = false
}

variable "vm_monitoring" {
  default = true
}

variable "vm_ipv6" {
  default = true
}

variable "vm_tags" {
  default = ["scanner"]
}
