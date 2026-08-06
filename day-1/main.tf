resource "aws_instance" "web" {
    provider= aws.mumbai
    ami ="ami-035827357e3c7e810"
    instance_type= "t2.micro"
    vpc_security_group_ids=[
        aws_security_group.ec2-sg.id]
}

resource "aws_instance" "app" {
    provider= aws.hyderabad
    ami ="ami-0304448c82662e9ac"
    instance_type= "t3.micro"
}