resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "acme_registration" {
  account_key_pem = "${tls_private_key.private_key.private_key_pem}"
  email_address   = "admin@${var.route_zone}"
}

resource "acme_certificate" "local_certificate" {
  account_key_pem = "${acme_registration.acme_registration.account_key_pem}"
  common_name     = "${data.terraform_remote_state.common.argos_local_root_fqdn}"

  subject_alternative_names = [
    "*.${data.terraform_remote_state.common.argos_local_root_fqdn}",
  ]

  dns_challenge {
    provider = "route53"

    config = {
      AWS_HOSTED_ZONE_ID = "${data.terraform_remote_state.common.zone_id}"
    }
  }
}

resource "local_file" "local_certificate" {
  content  = "${acme_certificate.local_certificate.certificate_pem}"
  filename = "cert.crt"
}

resource "local_file" "local_private_key" {
  content  = "${acme_certificate.local_certificate.private_key_pem}"
  filename = "cert.key"
}

resource "local_file" "issuer_certificate" {
  content  = "${acme_certificate.local_certificate.issuer_pem}"
  filename = "issuer.pem"
}
