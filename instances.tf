resource "aws_instance" "kube_master" {
  connection {
    user = "ec2-user"
  }

  instance_type = "t2.small"

  ami = "${lookup(var.aws_amis, var.aws_region)}"

  key_name = "${aws_key_pair.auth.id}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  subnet_id = "${aws_subnet.default.id}"

  tags {
    Name = "${var.instance_name_master}"
  }

  user_data = "${data.template_cloudinit_config.config_master.rendered}"

}

resource "aws_instance" "kube_slave" {
  connection {
    user = "ec2-user"
  }

  count = 2

  instance_type = "t2.small"

  ami = "${lookup(var.aws_amis, var.aws_region)}"

  key_name = "${aws_key_pair.auth.id}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  subnet_id = "${aws_subnet.default.id}"

  tags {
    Name = "${var.instance_name_slave}"
  }

  user_data = "${data.template_cloudinit_config.config_slave.rendered}"

}

data "template_cloudinit_config" "config_master" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${file("cloudinit/kube_master.userdata.txt")}"
  }
}

data "template_cloudinit_config" "config_slave" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${file("cloudinit/kube_slave.userdata.txt")}"
  }
}
