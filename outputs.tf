output "instance_public_addresses" {
  value = "${join(", ", aws_instance.swarm.*.public_ip)}"
}

output "elb_dns_name" {
  value = "${aws_elb.swarm_elb.dns_name}"
}
