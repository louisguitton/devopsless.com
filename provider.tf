# https://www.terraform.io/docs/providers/do/index.html

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

resource "digitalocean_ssh_key" "default" {
  name       = "Onefootball laptop"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}
