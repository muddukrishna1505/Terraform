resource "aws_instance" "demo-1" {
    ami      = var.ami_id
    instance_type = lookup(var.instance_type, local.environment)
    vpc_security_group_ids = [aws_security_group.allow_terraform.id] # list
    # labels, metadata, info, etc

    tags = {
        Name = "${var.project}-${local.environment}-workspace"
        prject = var.project
        environment = local.environment
    }
  
}

#SG created in default VPC
resource "aws_security_group" "allow_terraform" {
    name    = "${var.project}-${local.environment}-workspace-sg"
    description = "Allow TLS inbound traffic and all outbound traffic"


#egress

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project}-${local.environment}-workspace" #roboshop-dev-workspace
        prject = var.project
        environment = local.environment 
    }

    
}    

