output "virtual_machine_ip" {
  value       = module.virtual_machine.public_ip_address
  description = "Public IP address of the virtual machine"
}
