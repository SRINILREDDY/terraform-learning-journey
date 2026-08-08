resource "aws_instance" "srinil" {
    ami = var.ami_id
    instance_type = var.instance_type

    tags = {
        Name = "srinil"
    }
}