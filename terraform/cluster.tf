resource "vultr_instance" "master" {
  count = 2
  plan = "vc2-2c-4gb"
  region = "fra"
  os_id = "387"
  enable_ipv6 = true
  ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

resource "vultr_instance" "worker" {
  count = 3
  plan = "vc2-2c-4gb"
  region = "fra"
  os_id = "387"
  enable_ipv6 = true
  ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

resource "vultr_instance" "database" {
  count = 3
  plan = "vc2-1c-2gb"
  region = "fra"
  os_id = "387"
  enable_ipv6 = true
  ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

resource "vultr_instance" "lb" {
  plan = "vc2-1c-2gb"
  region = "fra"
  os_id = "387"
  enable_ipv6 = true
  ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

resource local_file "inventory" {
  content = templatefile(
    "${path.module}/templates/inventory.tmpl",
    {
      masters = vultr_instance.master.*.main_ip,
      workers = vultr_instance.worker.*.main_ip,
      lbs = vultr_instance.lb.*.main_ip,
      databases = vultr_instance.database.*.main_ip,
    }
  )
  filename = "../ansible/inventories/inventory.ini"
}