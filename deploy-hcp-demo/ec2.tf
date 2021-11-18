data "aws_ami" "latest-ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "instances" {
  name        = "linux"
  description = "linux ports"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.latest-ubuntu.id
  instance_type               = "t3.nano"
  key_name                    = "jmartinson"
  user_data                   = file("userdata.sh")
  associate_public_ip_address = true
  subnet_id                   = "subnet-04aabcd367d40bebe"
  vpc_security_group_ids      = [aws_security_group.instances.id]
  tags = {
    name = "jmartinson-vault-demo"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}