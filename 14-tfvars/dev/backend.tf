   
    bucket = "bmkrishtech-terraform-dev"
    key    = "bmkrishtech-tfvars.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # Enables native S3 state locking (Terraform 1.10+)