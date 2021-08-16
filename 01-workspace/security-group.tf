resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "Security group that allows ssh and all egress traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}
