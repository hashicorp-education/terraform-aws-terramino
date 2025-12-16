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

  iam_instance_profile = aws_iam_instance_profile.redis_read_ssm.name

  user_data = templatefile("boot.sh", {
    app_name = var.waypoint_application,
    port     = var.port
  })

  tags = {
    Name = "terramino-${var.waypoint_application}"
  }
}
