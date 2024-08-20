
variable "instance_type" {
  default = "t3.micro"
}

variable "domain_name" {
  default = "harshaneo.online"
}

variable "components" {
  default = ["frontend", "catalogue", "mongo"]
}