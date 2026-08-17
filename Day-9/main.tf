provider "aws" {
    region ="ap-south-1"
}

resource "aws_instance" "srinil" {
count = var.environent=="prod"? 2:1
ami = "ami-035827357e3c7e810"
instance_type = var.environent=="prod" ? "t3.medium":"t2.micro"

tags ={
    Name ="srinil"
}
}