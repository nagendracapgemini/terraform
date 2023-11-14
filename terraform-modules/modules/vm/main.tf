resource "azurerm_windows_virtual_machine" "vm" {
  name                = "my-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_DS2_v2"

  admin_username = "adminuser"
  admin_password = "P@ssw0rd1234!"

  network_interface_ids = [azurerm_network_interface.nic.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  
}

resource "azurerm_network_interface" "nic" {
  name                = "my-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.vm.network_interface_ids[0]
}

