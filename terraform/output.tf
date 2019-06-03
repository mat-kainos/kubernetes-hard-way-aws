output security_group_my_cidr_block {
  value = "${chomp(data.http.my_ip.body)}/32"
}

output ec2_connection_strings {
  value = "${formatlist(
    "%s: ssh -i ${path.cwd}/${var.private_key_file_name} ubuntu@%s",
    var.ec2_details.names,
    aws_instance.ec2.*.public_dns
  )}"
}
