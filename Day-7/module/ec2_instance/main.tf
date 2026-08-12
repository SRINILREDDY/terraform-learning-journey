provider "aws" {
    region ="ap-south-1"
}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

resource "aws_instance" "app" {
    ami =var.ami
    instance_type =var.instance_type
  
}