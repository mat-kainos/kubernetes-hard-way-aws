

variable environment {
  default = "Lab"
}

variable external_ip_check_url {
  default = "http://ipv4.icanhazip.com"
}

variable private_key_file_name {
  default = "ssh_ec2_key.pem"
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

variable ec2_details {
  default = {
    number_of_instances = 2
    private_ips    = ["10.0.10.11", "10.0.10.21"]
    names = ["kthw-controller", "kthw-worker-1"]
  }
}
