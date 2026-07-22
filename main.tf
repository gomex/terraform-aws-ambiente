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
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = var.instance_type

  tags = {
    Name = local.name
  }

  dynamic "ebs_block_device" {
    for_each = var.volumes-extras
    content {
      device_name = ebs_block_device.value["device_name"]
      volume_size = ebs_block_device.value["volume_size"]
    }
  }

}
