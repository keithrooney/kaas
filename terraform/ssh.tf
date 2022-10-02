resource "vultr_ssh_key" "root" {
  name = "quartermaster - root - public key"
  ssh_key = "${file("/home/krooney/.ssh/root/id_ecdsa.pub")}"
}