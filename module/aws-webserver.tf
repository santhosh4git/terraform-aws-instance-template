
resource "aws_instance" "my_web_server" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  tags = {
    Name = "${var.tag}"
  }
}