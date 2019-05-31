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

resource "aws_instance" "ec2" {
  ami           = "${data.aws_ami.ec2_ami.id}"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = ["${aws_security_group.sec_group.id}"]
  subnet_id = aws_subnet.subnet.id
  associate_public_ip_address = true
  #vpc_security_group_ids = [aws_vpc.vpc.id]

  tags = {
    Name        = var.tag_name,
    Environment = var.environment
  }
}