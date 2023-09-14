# EC2


resource "aws_instance" "ec2-server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.ubuntu-keypair.key_name
  associate_public_ip_address = true
}

output "ip" {
  value = aws_instance.ec2-server.public_ip
}
