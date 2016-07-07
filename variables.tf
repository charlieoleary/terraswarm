variable "aws_access_key" {
  description = "Your AWS access key."
}

variable "aws_secret_key" {
  description = "Your AWS secret key."
}

variable "aws_ssh_key" {
  description = "The name of the AWS key that will be assigned to your instance.  This must also be located in your '~/.ssh/' directory with the same name and a .pem extension."
}

variable "region" {
  default = "us-west-2"
}

variable "availability_zones" {
  default = {
    "0" = "a"
    "1" = "b"
    "2" = "c"
  }
}
