provider "aws" {
    region = "ap-south-1"
}

variable "ami" {
  type = string
}

variable "instance_type"{
    type =string
}

module "ec2_instance"{
    source = "./module/ec2_instance"
    ami =var.ami
    instance_type =  var.instance_type
}

