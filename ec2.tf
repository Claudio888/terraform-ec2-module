data "aws_ami" "ubuntu"{
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu-packerpipeline-*"]
  }
  owners = ["933375035704"] #Propria conta AWS
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = "ec2-default"
  tags = {
    Name = format("%s-%s",var.name,var.env_prefix)
      }
  vpc_security_group_ids = var.enable_sg ? [aws_security_group.instance_security_group.id] : [data.aws_security_group.default.id]
}