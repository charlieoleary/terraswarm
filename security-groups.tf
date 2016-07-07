# create elb sg
resource "aws_security_group" "swarm_elb_sg" {
  name = "swarm-elb-sg"
  description = "security group for swarm elb"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create security group
resource "aws_security_group" "swarm_instance_sg" {
  name = "swarm-instance-sg"
  description = "security group for swarm nodes"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = ["amazon-elb/amazon-elb-sg"]
  }

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    self = true
  }

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "udp"
    self = true
  }

  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    self = true
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
