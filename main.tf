data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.small"
  security_groups = [aws_security_group.allow_web_traffic.name]

  key_name = aws_key_pair.ssh_key.key_name
  user_data = templatefile("boot.sh", {
    client_id     = var.client_id,
    client_secret = var.client_secret,
    org_id        = var.org_id,
    project_id    = var.project_id
  })

  tags = {
    Name = "terramino-web"
  }
}
