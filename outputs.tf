output "hostname" {
  value = "http://${aws_instance.web.public_ip}:8080"
}

output "ip" {
  value = aws_instance.web.public_ip
}
