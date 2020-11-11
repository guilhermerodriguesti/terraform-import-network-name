
provider "aws" {
  region = "us-east-1"
}

variable conta {

  default = "orgarnization"
}

data "aws_vpc" "selected" {
    filter {
    name   = "tag:Name"
    values = ["Main-VPC"] # its possible another value
  }
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = ["organization_subnet"] # insert value here
  }
}

output "vpc" {
    value = data.aws_vpc.selected.id
}

output "subnet" {

  value = data.aws_subnet_ids.selected
}
