variable "aws_region" {
    type   = string
    default = "us-east-1"
    description = "Zone de la région AWS"
}

variable "my_ip_cidr" {
    type   = string
    description = "CIDR block pour l'accès SSH"
}

variable "ec2_key" {
    type   = string
    description = "Nom de la paire de clés EC2 pour l'accès SSH"
  
}