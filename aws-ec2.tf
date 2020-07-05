provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_security_group" "MyFirstSG" {
  name        = "tf-instance-sg"
  description = "Security Group for TF-Instance"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "MyFirstInstnace" {
  count           = "${var.instance_count}"
  ami             = "${var.ami_id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.aws_key}"
  vpc_security_group_ids = [ "${aws_security_group.MyFirstSG.id}" ]
  
  tags = {
    Name = "TF-Server"
   }
}