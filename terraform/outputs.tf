### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("../ansible/inventory.tmpl",
 {
  monitoramento-dns = aws_instance.monitoramento[0].public_dns,
  app-dns = aws_instance.app.*.public_dns
 }
 )
 filename = "../ansible/inventory"
}
