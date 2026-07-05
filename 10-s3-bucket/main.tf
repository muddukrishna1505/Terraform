resource "aws_s3_bucket" "terraform_state" {
    bucket = "bmkrishtech-terraform-state"

    tags = {
        Name = "terraform-state-bucket"
        Project = "roboshop"
        Environment = "dev"
    }
  
}