# outputs.tf

output "instance_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.example[*].public_ip
}

output "instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = aws_instance.example[*].private_ip
}
