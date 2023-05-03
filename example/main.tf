module "virtual_network" {
  source = "github.com/Anshuman2121/azure_modules_example.git//vnet"
  virtual_network_name = "myVNet"
  address_space        = "10.0.0.0/16"
  subnets = [
    {
      name   = "default"
      prefix = "10.0.1.0/24"
    }
  ]
}

module "virtual_machine" {
  source = "github.com/Anshuman2121/azure_modules_example.git//vm"
  vm_size             = "Standard_D2_v2"
  virtual_network_name = "myVNet"
  subnet_name          = "default"
  admin_username       = "adminuser"
  admin_password       = "P@ssw0rd1234!"
  os_image = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

module "storage_account" {
  source                  = "github.com/Anshuman2121/azure_modules_example.git//storage"
  storage_account_name    = "mystorageaccount"
  account_tier            = "Standard"
  account_replication_type = "LRS"
}
