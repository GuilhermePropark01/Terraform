output "subnet_id" {
  value = [for subnet in aws_subnet.SubNet : subnet.id]
}