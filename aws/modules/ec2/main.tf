resource "aws_security_group" "security-group" {
  name        = "securitygroup_app-${var.proyecto}"
  description = "securitygroup para la instancia ec2"
  vpc_id      = var.vpc.id
  ingress {
    description = "all trafic from vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(
    var.tags, {
      Name = "sg-ec2-${var.proyecto}",
      name = "sg-ec2-${var.proyecto}"
    }
  )
}

resource "aws_instance" "instancia-app" {
  ami                    = "ami-0069d66985b09d219"
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.instance-prof-app.id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  subnet_id              = var.subnet_id
  tags = merge(
    var.tags, {
      Name = "ec2-${var.proyecto}",
      name = "ec2-${var.proyecto}"
    }
  )
}
