variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "my_kube_master_key"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-2"
}

variable "instance_name_master" {
  default     = "kube_master_eval"
}

variable "instance_name_slave" {
  default     = "kube_slave_eval"
}

variable "owner" {
  default     = "maxstack"
}

variable "aws_amis" {
  default = {
    ap-southeast-2 = "ami-d38a4ab1"
  }
}
