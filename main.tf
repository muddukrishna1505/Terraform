resource "aws_instance" "terraform-instance" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ] 

  tags = {
    Name = "test-instance"
    User = "krishna"
  }
  
}

#Creting SG
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound and all outbound traffic"

    #for inbound
    ingress {
        description = "SSH Access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #for outbound
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #means all protocols.
    cidr_blocks      = ["0.0.0.0/0"]

    
    
  }

  tags = {
    Name = "allow_tls"
  }
}
