# main.tf

provider "aws" {
  region = var.region  # Change the region as needed.
}

resource "aws_instance" "example" {
  count         = 3
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  
  tags = {
    Name = "Terraform-Sana-EC2-${count.index + 1}"
  }
  
  # Optionally, you can add key_name, security_groups, and additional parameters as needed.
}
