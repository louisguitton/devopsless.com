# https://www.terraform.io/docs/providers/do/r/droplet.html
resource "digitalocean_droplet" "wordpress" {
  image       = "wordpress-18-04"
  name        = "devopsless-wordpress"
  region      = "fra1"
  size        = "s-1vcpu-1gb"  # https://developers.digitalocean.com/documentation/changelog/api-v2/new-size-slugs-for-droplet-plan-changes/
  ssh_keys    = [digitalocean_ssh_key.default.fingerprint]
  monitoring  = true
}

# https://www.terraform.io/docs/providers/do/r/domain.html
resource "digitalocean_domain" "default" {
  name       = "devopsless.com"
  ip_address = digitalocean_droplet.wordpress.ipv4_address
}

# https://www.terraform.io/docs/providers/do/r/record.html
resource "digitalocean_record" "CNAME-www" {
  name    = "www"
  domain  = "${digitalocean_domain.default.name}"
  type    = "CNAME"
  value   = "@"
}

# https://www.terraform.io/docs/providers/do/r/project.html
resource "digitalocean_project" "devopsless" {
  name        = "devopsless.com"
  description = "The DevOpsLess website"
  purpose     = "Web Application"
  environment = "Production"
  resources   = ["${digitalocean_droplet.wordpress.urn}", "${digitalocean_domain.default.urn}"]
}

# print out the IP address (needed to SSH into the server after creation for a final configuration step)
output "ip" {
  value   = digitalocean_droplet.wordpress.ipv4_address
}
