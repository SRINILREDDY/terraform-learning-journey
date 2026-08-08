provider "aws" {
    region="ap-south-1"
  
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_id = "ami-035827357e3c7e810"
  instance_type = "t2.micro"
}