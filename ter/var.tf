variable "ami" {
  default = "ami-0c64dd618a49aeee8"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "user" {
  default = "ec2-user"
}
variable "instag" {
  default = "inst-1"
}
variable "prot" {
  default = "tcp"
}
variable "sgtag" {
  default = "secgrp"
}
variable "p80" {
  default = 80
}
variable "p22" {
  default = 22
}
variable "vpc" {
  default = "vpc-7249b619"
}

