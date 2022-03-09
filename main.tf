terraform {

}

provider "aws" {
  region = "us-west-1"
}

module "apache" {
    source = ".//terraform-aws-apache-example"
    vpc_id = var.vpc_id
    my_ip_with_cidr = var.my_ip_with_cidr
    public_key = var.public_key
    instance_type = var.instance_type
    server_name = var.server_name
}

output "public_ip" {
  value = module.apache.public_ip
}