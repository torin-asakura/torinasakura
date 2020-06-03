output "zone_id" {
  value = "${aws_route53_zone.main.id}"
}

output "zone_name" {
  value = "${aws_route53_zone.main.name}"
}

output "argos_local_root_fqdn" {
  value = "${aws_route53_record.argos_local_root.fqdn}"
}
