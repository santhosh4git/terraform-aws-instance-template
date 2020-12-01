output "instance_ip" {
  value = ["${aws_instance.my_web_server.public_ip}"]
}