# devopsless.com

> A Wordpress landing page that you can spin up in seconds

[![StackShare](http://img.shields.io/badge/tech-stack-0690fa.svg?style=flat)](https://stackshare.io/louisguitton/devopsless-com)

## Installation

```sh
brew install terraform
terraform init
```

## Usage example

```sh
export DO_PAT=xxxx
terraform plan -var "do_token=${DO_PAT}"
terraform apply -var "do_token=${DO_PAT}"
ssh root@$IP
# follow all the steps form the Wordpress 1-click installation
open https://devopsless.com
```

At this point the site is ready. But you can futher configure it,
either using the Worpdress admin panel or the Wordress CLI.

```sh
sh wordpress_automation.sh
open https://devopsless.com/wp-admin
```

When you're done having fun and wasting money, you can run:

```sh
terraform destroy
```

## Useful links

- https://infrastructioneer.com/2019/06/24/spinning-up-a-wordpress-blog-on-digitalocean-using-terraform/
- https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean
- https://www.terraform.io/docs/providers/do/index.html
