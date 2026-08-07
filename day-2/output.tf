output "dev_public_ip"{
    value=aws_instance.dev.public_ip
}

output "test_public_ip"{
    value=aws_instance.test.public_ip
}

output "prod_public_ip"{
    value=aws_instance.prod.public_ip
}

output "dev_instance_id"{
    value=aws_instance.dev.id
}

output "test_instance_id"{
    value=aws_instance.test.id
}

output "prod_instance_id"{
    value=aws_instance.prod.id
}