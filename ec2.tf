# ec2.tf
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-09024b009ae9e7adf"  # Change the AMI ID as needed
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_a.id  # Choose the appropriate subnet

  vpc_security_group_ids = [aws_security_group.vpc_security_group.id]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    encrypted             = true
    kms_key_id            = aws_kms_key.ec2_kms_key.id
    delete_on_termination = true
  }

  tags = {
    Name = "my-ec2-instance"
  }
}

resource "aws_security_group" "ec2_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  // Add necessary ingress and egress rules for EC2
}

resource "aws_kms_key" "ec2_kms_key" {
  description             = "KMS key for EC2 instance"
  deletion_window_in_days = 30
}
