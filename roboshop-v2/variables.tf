
variable "instance_type" {
  default = "t3.micro"
}

variable "domain_name" {
  default = "harshaneo.online"
}

variable "zone_id" {
  default = Z0698671ZTK19IKWO19R
}
variable "components" {
  default = ["frontend", "catalogue", "mongo"]
}