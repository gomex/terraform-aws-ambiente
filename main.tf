locals {
  name = lower(var.name)
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "ami-123456789"
  instance_type = var.instance_type

  tags = {
    Name = local.name
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      ami
    ]
    replace_triggered_by = [
      aws_instance.bd.tags
    ]
  }



  depends_on = [
    aws_instance.bd
  ]

}

resource "aws_instance" "bd" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = local.name
    Env  = "dev"
  }

}
