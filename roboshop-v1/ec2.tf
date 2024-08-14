resource "aws_instance" "frontend" {
  ami           = "ami-041e2ea9402c46c32"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-081c83c9e9e2eb782"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z0698671ZTK19IKWO19R"
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

resource "aws_instance" "catalogue" {
  ami           = "ami-041e2ea9402c46c32"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-081c83c9e9e2eb782"]

  tags = {
    Name = "catalogue"
  }
}