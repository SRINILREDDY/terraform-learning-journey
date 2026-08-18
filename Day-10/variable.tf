variable "ingress"{
    default = [
        {
            port = 80
            cidr = "0.0.0.0/0"
        },
        {
            port = 443
            cidr = "0.0.0.0/0"
        }
    ]
}

variable "egress" {
    default = [
        {
            port = 3306
            cidr = "10.0.4.0/24"
        }
    ]
  
}