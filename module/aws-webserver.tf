data "aws_ami" "web" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["RHEL-${var.rhel_version}*"] # Just for my testing
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  #owners      = ["self"] 
  owners      = ["309956199498"] # Amazon owned one..!
  most_recent = true
}

resource "aws_instance" "my_web_server" {
  ami           = data.aws_ami.web.id
  instance_type = "${var.instance_type}"
  tags = {
    Name = "${var.tag}"
  }
}