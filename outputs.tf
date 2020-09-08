output "name" {
  value = var.domain
}

output "zone_id" {
  value = aws_route53_zone.this.zone_id
}

output "nameservers" {
  value = aws_route53_zone.this.name_servers
}

output "delegator" {
  value = {
    name       = aws_iam_user.delegator.name
    access_key = aws_iam_access_key.delegator.id
    secret_key = aws_iam_access_key.delegator.secret
  }

  sensitive = true
}
