resource "aws_instance" "roboshop" {

  for_each = var.instances
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.roboshop[each.key].id,
    aws_security_group.common.id
  ]
  tags = {
    Name = "${var.project}-${var.environment}-${each.key}" # interpolation
  
  }
}


#Creting SG

resource "aws_security_group" "roboshop" {
  for_each = var.instances
  name        = "${var.project}-${var.environment}-${each.key}"
  description = "allow ssh for inbound and all traffic for outbound"


  #inbound
  ingress {

    from_port   = var.port_ingress
    to_port     = var.port_ingress
    protocol    = var.protocol
    cidr_blocks = var.cidr

  }

  #outbound 
  egress {
    from_port   = var.port_egress
    to_port     = var.port_egress
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  tags = {
    name = "${var.project}-${var.environment}-${each.key}" # interpolation
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "common" {
  name = "${var.project}-${var.environment}-common"
  description = "Allow TLS inbound traffic and all outbound traffic"

  #egress
  egress {
    from_port   = var.port_egress
    to_port     = var.port_egress
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  tags = {
    name = "${var.project}-${var.environment}-common"
  }

  lifecycle {
    create_before_destroy = true
  }
  
}


