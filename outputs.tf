output "name" {
  value       = local.domain_name
  description = "string ||| The name of the created domain."
}

output "fqdn" {
  value       = local.domain_name
  description = "string ||| The FQDN (fully-qualified domain name) for the created domain."
}

output "zone_id" {
  value       = aws_route53_zone.this.zone_id
  description = "string ||| "
}

output "nameservers" {
  value       = aws_route53_zone.this.name_servers
  description = "list(string) ||| A list of authoritative nameservers for the created domain."
}

output "delegator" {
  value       = local.delegator
  description = "object({ role_arn: string, session_duration: number }) ||| "
}
