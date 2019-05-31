

variable "environment" {
    default = "Lab"
}
variable "network" {
  description = "All network related variables"

  default = {
    vpc_cidr_block            = "10.0.0.0/16"
    vpc_tag_name = "kubernetes-the-hard-way-vpc"
    vpc_ig_tag_name = "kubernetes-the-hard-way-ig"
    
  }
}
