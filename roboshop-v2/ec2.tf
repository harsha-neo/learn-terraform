variable "ami" {
  default = "ami-041e2ea9402c46c32"
}"

variable "instance_type" {
  default = "t3.micro"
}

variable "security_group_ids" {
    default = ["sg-081c83c9e9e2eb782"]
}

variable "zone_id"{
    default = "Z0698671ZTK19IKWO19R"
    }



resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "frontend.dev.harshaneo.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongo" {
  ami           = "ami-041e2ea9402c46c32"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-081c83c9e9e2eb782"]

  tags = {
    Name = "mongo"
  }
}

resource "aws_route53_record" "mongo" {
  zone_id = "Z0698671ZTK19IKWO19R"
  name    = "mongo.dev.harshaneo.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.mongo.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = "ami-041e2ea9402c46c32"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-081c83c9e9e2eb782"]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z0698671ZTK19IKWO19R"
  name    = "catalogue.dev.harshaneo.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.catalogue.private_ip]
}
