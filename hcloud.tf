# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Create a server
resource "hcloud_server" "MinecraftPlanA" {
  name        = "my-server"
  image       = "ubuntu-20.04"
  server_type = "cx11"

# Java provisioning 
  provisioner "remote-exec" {
  command =  "sudo adduser minecraft; sudo usermod -aG sudo minecraft ; sudo apt install screen; sudo mkdir minecraft; cd minecraft ; sudo wget https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar"
  }
}




