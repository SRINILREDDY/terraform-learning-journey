resource "aws_vpc" "main"{
    cidr_block = var.vpc_cidr_block

    tags = {
      Name ="main"
    }
}
#internet for vpc
resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.main.id

    tags={
        Name="igw"
    }
}
#public-subnet
resource "aws_subnet" "public" {
    vpc_id =aws_vpc.main.id
    cidr_block = var.public_subnet_cidr

    tags={
        Name="public"
    }
  
}

#public-route table
resource "aws_route_table" "public-route" {
    vpc_id = aws_vpc.main.id

    route  {
        cidr_block ="0.0.0.0/0"
        gateway_id =aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "public-association" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public-route.id

}

#private-subnet
resource "aws_subnet" "private" {
    vpc_id =aws_vpc.main.id
    cidr_block = var.private_subnet_cidr

    tags={
       Name="private"
    }
  
}

#private-route table
resource "aws_route_table" "private-route" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
}

resource "aws_route_table_association" "private-association" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private-route.id

}

#nat
resource "aws_eip" "eip" {
    domain = "vpc"

    tags = {
      Name="eip"
    }
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.public.id

    tags={
        Name = "nat"
  
}
}