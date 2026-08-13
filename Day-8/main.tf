provider "aws" {
    region = "ap-south-1"
}

resource "aws_db_instance" "database"{
    identifier = "database"
    engine = "mysql"
    engine_version = "8.0.42"
    instance_class = "db.t3.micro"

    allocated_storage = 20
    storage_type = "gp3"

    db_name = "appdb"
    username = "srinil"
    password = "295812345"


    publicly_accessible = false
    skip_final_snapshot = true
}


resource "aws_secretsmanager_secret" "db" {
    name ="prod/rds/mysql"
}


resource "aws_secretsmanager_secret_version" "db" {
    secret_id = aws_secretsmanager_secret.db.id

    secret_string = jsonencode({
    username ="srinil"
    password ="295812345"
}) 
}
