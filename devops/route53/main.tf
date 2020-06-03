resource "aws_route53_zone" "main" {
  name = "${var.route_zone}"

  tags {
    Terraformed = "true"
    Name        = "torinasakura.dev"
  }
}

resource "aws_route53_record" "argos_local_root" {
  zone_id = "${aws_route53_zone.main.id}"

  name = "${var.argos}.local.${var.route_zone}"
  type = "A"

  ttl     = "300"
  records = ["127.0.0.1"]
}

resource "aws_route53_record" "argos_local_wildcard" {
  zone_id = "${aws_route53_zone.main.id}"

  name = "*.${var.argos}.local.${var.route_zone}"
  type = "A"

  ttl     = "300"
  records = ["127.0.0.1"]
}
