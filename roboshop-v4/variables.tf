
variable "domain_name" {
  default = "harshaneo.online"
}


variable "components" {
  default = {
    frontend = {
      instance_type = "t3.micro"
    }
    catalogue = {
      instance_type = "t3.micro"
    }
    mongo = {
      instance_type = "t3.small"
    }
  }
}