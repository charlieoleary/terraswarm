provider "aws" {
  region = "${var.region}"
}

# create swarm instances
resource "aws_instance" "swarm" {
  count = 3

  connection {
    user = "ubuntu"
    private_key = "~/.ssh/${var.aws_ssh_key}.pem"
  }

  tags {
    Name = "swarm-node-test-${count.index + 1}"
    Type = "swarm"
    Swarm_Role = "node"
  }

  ami = "ami-06a4b367"
  instance_type = "t1.micro"
  key_name = "${var.aws_ssh_key}"
  availability_zone = "${var.region}${lookup(var.availability_zones, count.index % 3)}"
  security_groups = ["${aws_security_group.swarm_instance_sg.name}"]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D",
      "echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty experimental' | sudo tee /etc/apt/sources.list.d/docker.list",
      "sleep 5",
      "sudo apt-get update && sudo apt-get install docker-engine -y"
      ]
  }
}
