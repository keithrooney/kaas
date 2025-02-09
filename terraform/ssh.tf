resource "vultr_ssh_key" "root" {
  name = "kaas - root - public key"
  ssh_key = "${file("~/.ssh/root/id_ecdsa.pub")}"
}
