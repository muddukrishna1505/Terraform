variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL AMI"

}

variable "project" {
  default = "roboshop"
  type = string
}

variable "environment" {
    type = string
    default = "dev"
    

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
  default = "allow_terraform_vars"
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


variable "instances" {
  type = map
  default = {
    mongodb = {                     #each.key = "mongodb"  
      "instance_type" = "t3.micro"  #each.value = ("instance_type" = "t3.micro")
    },
    redis = {
      "instance_type" = "t3.micro"
    },
    mysql = {
      "instance_type" = "t3.micro"
    },
    rabbitmq = {
      "instance_type" = "t3.micro"
    },
    catalogue = {
      "instance_type" = "t3.micro"
    },
    user = {
      "instance_type" = "t3.micro"
    },
    cart = {
      "instance_type" = "t3.micro"
    },
    shipping = {
      "instance_type" = "t3.micro"
    },
    payment = {
      "instance_type" = "t3.micro"
    },
    frontend = {
      "instance_type" = "t3.micro"
    }
  }
}


variable "zone_id" {
  
  default = "Z00981222UH92I1EWAVNF"
} 

variable "domain_name" {
  default = "bmkrishtech.online"
}