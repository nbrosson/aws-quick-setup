resource "aws_default_security_group" "default" {
   vpc_id      = aws_default_vpc.default.id
 ingress {
     # Open SSH port
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     
     # Note that opening to 0.0.0.0/0 can lead to security vulnerabilities.
     cidr_blocks     = ["0.0.0.0/0"]
   }
 egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
 }