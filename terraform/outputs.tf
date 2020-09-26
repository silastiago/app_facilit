
output "public_dns-monitoramento" {
  value = "${aws_instance.monitoramento[0].public_dns}"
}

output "public_dns_app" {
  value = "${aws_instance.app[0].public_dns}"
}
output "private_ip_app" {
  value = "${aws_instance.app[0].private_ip}"
}
output "public_ip_app" {
  value = "${aws_instance.app[0].public_ip}"
}
