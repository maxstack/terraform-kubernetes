#!/bin/bash

YOUR_IP=$(curl -s ifconfig.co)

echo 'variable "my_ip" {
  description = "IP to whitelist for incoming traffic, must be CIDR"
  default     = "'$YOUR_IP'/32"
}' > your_ip.tf
