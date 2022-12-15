resource "vultr_instance" "db" {
    count = 3
    plan = "vc2-1c-2gb"
    region = "fra"
    os_id = "387"
    enable_ipv6 = true
    ssh_key_ids = ["${vultr_ssh_key.root.id}"]
}

output "databases" {
  value = vultr_instance.db.*.main_ip
}