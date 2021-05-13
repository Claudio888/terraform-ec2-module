data "aws_security_group" "default" {
  filter {
    name   = "group-name"
    values = ["default"] 
  }
  
  tags = {
    produto   = "default"
  }
}


resource "aws_security_group" "instance_security_group" {
  count = var.enable_sg ? 1 : 0
  name        = format("getipsg-%s",var.env_prefix)
  description = format("Sg for - %s",var.env_prefix)

  dynamic "ingress"{
      for_each = var.ingress_ports
      content {
        from_port = ingress.value
        to_port   = ingress.value
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
  }
  
   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
}