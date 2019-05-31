

variable environment {
  default = "Lab"
}

variable external_ip_check_url {
  default = "http://ipv4.icanhazip.com"
}
variable tag_name {
  default = "kubernetes-the-hard-way"
}
variable network {
  description = "All network related variables"

  default = {
    vpc_cidr_block    = "10.0.0.0/16"
    subnet_cidr_block = "10.0.10.0/24"

  }
}
