resource "aws_instance" "dev" {
    instance_type = var.dev_instance_type
    ami = var.devami_id

    tags={
        Name="dev"
    }
}

resource "aws_instance" "test" {
    instance_type = var.test_instance_type
    ami = var.testami_id
    
    tags={
        Name="test"
    }
}

resource "aws_instance" "prod" {
    instance_type = var.prod_instance_type
    ami = var.prodami_id

    tags={
        Name="prod"
    }
}