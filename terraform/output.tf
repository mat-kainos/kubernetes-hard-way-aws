output security_group_my_cidr_block {
  value = "${chomp(data.http.my_ip.body)}/32"
}

output ip_address {
  value = aws_instance.ec2.public_dns
  
}