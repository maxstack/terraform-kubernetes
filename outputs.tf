output "kube_master_address" {
  value = "${aws_instance.kube_master.public_ip}"
}

output "kube_slave1_address" {
  value = "${aws_instance.kube_slave1.public_ip}"
}

output "kube_slave2_address" {
  value = "${aws_instance.kube_slave2.public_ip}"
}
