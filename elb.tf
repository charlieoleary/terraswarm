# create an elb
resource "aws_elb" "swarm_elb" {
  name = "swarm-elb"
  availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  instances = ["${aws_instance.swarm.*.id}"]
}
