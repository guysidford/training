# ami = ami-8328bbf0
# subnet_id      = "subnet-51ab1e09"
# vpc_security_group_ids = ["sg-01272d66"]
# Identity = "capgemini-cfcd208495d565ef66e7dff9f98764da"
#
 

# provider "aws" {
#   access_key = "AKIAI2XA5FO4IQEX3CNA"
#   secret_key = "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"
#   region     = "eu-west-1"
# }

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "eu-west-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

# module "example" {
#   source = "./example-module"
#   command = "echo Hello guy"
# }

resource "aws_instance" "web" {
  count 	 = "2"
  ami 		 = "ami-8328bbf0"
  instance_type  = "t2.micro"
  subnet_id 	 = "subnet-51ab1e09"
  vpc_security_group_ids = ["sg-01272d66"]
  tags {
    Identity = "capgemini-cfcd208495d565ef66e7dff9f98764da"
    Name = "Arnold"
    Rimmer = "Ace" 
  }
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}

output "public_dns" {
  value = "${aws_instance.web.public_dns}"
}


