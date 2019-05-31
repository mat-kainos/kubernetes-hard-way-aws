resource "aws_vpc" "kube-vpc" {
  cidr_block = var.network["vpc_cidr_block"]
  enable_dns_hostnames = true


  tags = "${
    map(
     "Name", var.network["vpc_tag_name"],
     "Environment", var.environment
    )
  }"
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.kube-vpc.id

  tags = "${
    map(
     "Name", var.network["vpc_ig_tag_name"],
     "Environment", var.environment
    )
  }"
}