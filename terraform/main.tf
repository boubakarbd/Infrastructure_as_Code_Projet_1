resource "aws_security_group" "web_sg" {
  name        = "allow_web_traffic"
  description = "Description du groupe de sécurité pour autoriser le trafic Tomcat, Jenkins et SSH"

  # Bloc pour le trafic entrant (Ingress)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Bloc pour le trafic sortant (Egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"]  # ID de l'éditeur Canonical


    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
}

resource "aws_instance" "web_app" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t3.medium"
    key_name = var.ec2_key
    vpc_security_group_ids = [aws_security_group.web_sg.id]


    user_data = filebase64("userdata.sh")
}