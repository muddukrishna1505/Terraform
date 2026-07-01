resource "aws_instance" "roboshop" {

  count = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.roboshop[count.index].id,
    aws_security_group.common.id
  ]
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}" # interpolation
  
  }
}


#Creting SG

resource "aws_security_group" "roboshop" {
  count       = length(var.instances)
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
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
    name = "${var.project}-${var.environment}-${var.instances[count.index]}" # interpolation
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
  
}


