resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "${var.cdirs_acesso_remoto}"
  }
  tags = {
    Name = "ssh"
  }
}




resource "aws_security_group" "acesso-sample" {
  name        = "acesso-sample"
  description = "acesso-sample"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "acesso-sample"
  }
}

resource "aws_security_group" "acesso-grafana" {
  name        = "acesso-grafana"
  description = "acesso-grafana"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "acesso-grafana"
  }
}

resource "aws_security_group" "acesso-docker" {
  name        = "acesso-docker"
  description = "acesso-docker"

  ingress {
    from_port   = 9323
    to_port     = 9323
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "acesso-docker"
  }
}


resource "aws_security_group" "acesso-prometheus" {
  name        = "acesso-prometheus"
  description = "acesso-prometheus"

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "acesso-prometheus"
  }
}

resource "aws_security_group" "acesso-web" {
  name        = "acesso-web"
  description = "acesso-web"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "${var.cdirs_acesso_remoto}"
  }

egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web"
  }
}



resource "aws_security_group" "acesso-https" {
  name        = "acesso-https"
  description = "acesso-https"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "${var.cdirs_acesso_remoto}"
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "https"
  }
}
