resource "aws_key_pair" "ubuntu-keypair" {
  key_name   = "ubuntu-keypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}