output "ami_id" {
    value = data.aws_ami.amazon_linux_2.id
    description = "The most recent AMI "
}