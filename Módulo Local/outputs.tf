output "VirtualMachine_IP" {
  value = aws_instance.VirtualMachine01.public_ip
}