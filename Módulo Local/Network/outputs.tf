output "subnet_id" {
  value = aws_subnet.SubNet.id
}

output "security_group_id" {
  value = aws_security_group.AllowSSH.id
}