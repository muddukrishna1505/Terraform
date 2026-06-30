variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL AMI"

}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The size of the EC2 instance to deploy"


  validation {
    condition     = contains(["t3.micro", "t2.micro", "t3.small"], var.instance_type)
    error_message = "Instance type should be either t3.micro or t3.small"
  }

}

variable "sg_name" {
  default = "allow_ssh"
}

variable "port_ingress" {
  type    = number
  default = 22

}

variable "port_egress" {
  type    = number
  default = 0

}

variable "protocol" {
  type    = string
  default = "tcp"

}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name         = "Instance-2"
    Project_Name = "Roboshop"
    Environment  = "Dev"
  }


}