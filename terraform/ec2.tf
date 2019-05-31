data aws_ami ec2_ami {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource aws_instance ec2 {
  ami           = "${data.aws_ami.ec2_ami.id}"
  instance_type = "t2.small"
  key_name      = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = ["${aws_security_group.sec_group.id}"]
  subnet_id = aws_subnet.subnet.id
  associate_public_ip_address = true

  count = var.ec2_details["number_of_instances"]
  private_ip = var.ec2_details["private_ips"][count.index]
  
  tags = {
    Name        = var.ec2_details["names"][count.index],
    Environment = var.environment
  }
}