resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.amazon_linux_2.id # <- Use an appropriate AMI for your region
  instance_type = var.instance_type

  subnet_id              = var.subnet_id  # Existing subnet in the VPC
  vpc_security_group_ids = [var.security_group]     # Existing SG in the same VPC
  key_name               = "my-key"               # Optional: use SSH key

  tags = {
    Name = "My-Sana-Provisioned-EC2Instance"
  }
}