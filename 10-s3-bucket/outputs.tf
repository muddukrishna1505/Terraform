output "bmkrishtech-terraform-state-dev" {
    value = aws_s3_bucket.terraform-state-dev.bucket
  
}

output "bmkrishtech-terraform-state-prod" {
    value = aws_s3_bucket.terraform-state-prod.bucket
  
}

output "bmkrishtech-terraform-state" {
    value = aws_s3_bucket.terraform-state.bucket
  
}