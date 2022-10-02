resource "vultr_instance" "master" {
  plan = "vc2-2c-4gb"
  region = "fra"
  os_id = "387"
  enable_ipv6 = true
  ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

resource "vultr_instance" "worker" {
  plan = "vc2-2c-4gb"
  region = "fra"
  os_id = "387"
  enable_ipv6 = true
  ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

output "masters" {
  value = vultr_instance.master.*.main_ip
}

output "workers" {
  value = vultr_instance.worker.*.main_ip
}