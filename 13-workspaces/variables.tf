variable "project" {
    type = string
    default = "roboshop"
  
}

variable "instance_type" {
    default = {
        dev = "t3.micro" 
        prod = "t3.small"
    }
  
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"   
}