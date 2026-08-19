provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app" {
    ami ="ami-0ac7b260cf76d8865"
    instance_type = "t2.micro"

    tags= {
        Name ="rani"
    }

    lifecycle {
        replace_triggered_by = [ aws_security_group.app ]
    }
}


resource "aws_security_group" "app" {
  name        = "app"
  description = "allow ec2"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}