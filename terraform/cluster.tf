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

resource "vultr_instance" "database" {
  count = 3
  plan = "vc2-1c-2gb"
  region = "fra"
  os_id = "387"
  enable_ipv6 = true
  ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

output "databases" {
  value = vultr_instance.database.*.main_ip
}

resource "vultr_instance" "lb" {
  plan = "vc2-1c-2gb"
  region = "fra"
  os_id = "387"
  enable_ipv6 = true
  ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

output "load_balancer" {
  value = vultr_instance.lb.*.main_ip
}
