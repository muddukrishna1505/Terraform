locals {
  name = "${var.project}-${var.environment}" #roboshop-dev
  ami_id = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  common_tags = {
    Name = "${var.project}-${var.environment}"
    project = var.project
    environment = var.environment
  }

  ec2_tags = merge(local.common_tags,
    {
      Name = "${var.project}-${var.environment}-locals-demo"  #roboshop-dev-locals-demo
    }
  )

  sg_tags = merge(local.common_tags,
  {
    Name = "${var.project}-${var.environment}-common-sg"
  }
)
}

