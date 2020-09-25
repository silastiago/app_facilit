terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "monitoramento" {
  count = 1
  ami = "ami-07efac79022b86107"
  instance_type = "t2.micro"
  key_name = "servidor"
  tags = {
    Name = "monitoramento"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}", 
                            "${aws_security_group.acesso-web.id}",
                            "${aws_security_group.acesso-prometheus.id}"
                            ]
}

resource "aws_instance" "app" {
  count = 1
  ami = "ami-07efac79022b86107"
  instance_type = "t2.micro"
  key_name = "servidor"
  tags = {
    Name = "app"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}", 
                            "${aws_security_group.acesso-sample.id}",
                            "${aws_security_group.acesso-web.id}"]
}

