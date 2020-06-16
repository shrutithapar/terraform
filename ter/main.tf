provider "aws" {
  region = "us-east-2"
}
resource "aws_key_pair" "deployer" {
  key_name = "samplekey"
  public_key = file("id_rsa.pub")
}
resource "aws_instance" "task1" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "samplekey"
  security_groups = ["${aws_security_group.secgrp.name}"]
  user_data = "${file("httpd.sh")}"
  tags = {
    Name = "${var.instag}"
  }
}
resource "aws_security_group" "secgrp" {
  name        = "secgrp"
  description = "Allow inbound and outbound traffic"
  vpc_id      = "${var.vpc}"
  ingress {
    description = "inbound rule"
    from_port   = "${var.p80}"
    to_port     = "${var.p80}"
    protocol    = "${var.prot}"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "inbound rule"
    from_port   = "${var.p22}"
    to_port     = "${var.p22}"
    protocol    = "${var.prot}"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = "${var.p80}"
    to_port     = "${var.p80}"
    protocol    = "${var.prot}"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = "${var.p22}"
    to_port     = "${var.p22}"
    protocol    = "${var.prot}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.sgtag}"
  }
}
