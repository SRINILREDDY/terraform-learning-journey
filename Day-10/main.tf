provider "aws" {
    region = "ap-south-1"
}

resource "aws_security_group" "srinil" {
    name ="srinil"

    dynamic "ingress" {
        for_each = var.ingress
        content {
          from_port = ingress.value.port
          to_port =  ingress.value.port
          protocol = "tcp"
          cidr_blocks = [ingress.value.cidr]
        }
      
    }

    dynamic "egress" {
        for_each = var.egress

        content {
          from_port = egress.value.port
          to_port = egress.value.port
          protocol = "tcp"
          cidr_blocks = [egress.value.cidr]
        }
      
    }
}