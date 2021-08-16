output "web_instance_ip" {
  value = aws_instance.web.public_ip
}

output "env_current" {
  value = local.exp_env
}