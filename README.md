# terraform-kubernetes

A terraform project to spin up an evaluation Kubernetes cluster, master and two slaves - only the infrastructure.

## Getting Started

```
bash your_ip.sh
terraform init
terraform plan
terraform apply
```

### Prerequisites

Edit variables.tf to match your environment.

Create a secrets.tf and provide your AWS access and secret key. Example format below:
```
cat secrets.tf
variable "aws_access_key" {
  default = "access_key"
}

variable "aws_secret_key" {
  default = "secret_key"
}
```

Make sure to run your_ip.sh so Terraform can whistelist your IP address.
