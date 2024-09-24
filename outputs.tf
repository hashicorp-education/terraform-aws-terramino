output "hostname" {
  value = "http://${aws_instance.web.public_ip}:${var.port}"
}

output "ip" {
  value = aws_instance.web.public_ip
}
