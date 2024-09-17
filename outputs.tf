output "hostname" {
  value = "http://${aws_instance.web.public_ip}:8080"
}

output "ip" {
  value = aws_instance.web.public_ip
}

output "security_group" {
  value = aws_security_group.allow_web_traffic.id
}