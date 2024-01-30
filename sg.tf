resource "aws_security_group" "ec2_security_group" {
  vpc_id = aws_vpc.my_vpc.id
ingress {
description = "allow ssh from any"
from_port = 0
to_port =  0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
description = "allow egress to any"
from_port = 0
to_port =  0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]

}

tags = {
    Name = "ec2_security_group"
}

}

resource "aws_security_group" "vpc_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
description = "allow ssh from any"
from_port = 0
to_port =  0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "vpc_security_group"
}

  // Add additional ingress rules as needed
}