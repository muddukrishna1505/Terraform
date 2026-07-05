resource "aws_s3_bucket" "terraform-state-dev" {
    bucket = "bmkrishtech-terraform-dev"


    tags = {
        Name = "terraform-state-bucket"
        Project = "roboshop"
        Environment = "dev"
    }
  
}

resource "aws_s3_bucket" "terraform-state-prod" {
    bucket = "bmkrishtech-terraform-prod"

    tags = {
        Name = "terraform-state-bucket"
        Project = "roboshop"
        Environment = "prod"
    }
  
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "bmkrishtech-terraform-state"

    tags = {
        Name = "terraform-state-bucket"
        Project = "roboshop"
        Environment = "prod"
    }
}