variable "name" {
  default = "production"
}

variable "cidr" {
  default = "10.70.0.0/16"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "${var.name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}
