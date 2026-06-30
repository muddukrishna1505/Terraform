resource "aws_instance" "instance-1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags                   = var.ec2_tags

}

#Creting SG

resource "aws_security_group" "allow_ssh" {
  name        = var.sg_name
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
    name = "practice"

  }
}

