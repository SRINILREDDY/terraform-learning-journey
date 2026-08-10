terraform {
  backend "s3" {
    bucket = "srinil-539"
    region ="ap-south-1"
    key = "terraform.tfstate"
  }
}