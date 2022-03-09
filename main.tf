terraform {
    backend "remote" {
      hostname = "app.terraform.io"
      organization = "demo-lab-test"

      workspaces {
          name = "vsc-terraform"
      }
    }
}

provider "aws" {
  region = "us-west-1"
}

module "apache" {
    source  = "m-satishkumar/apache-esample/aws"
    version = "1.0.0"
    vpc_id = var.vpc_id
    my_ip_with_cidr = var.my_ip_with_cidr
    public_key = var.public_key
    instance_type = var.instance_type
    server_name = var.server_name
}

output "public_ip" {
  value = module.apache.public_ip
}