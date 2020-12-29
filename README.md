# block-aws-domain

Nullstone Block standing up a domain in AWS Route53.

## Variables

- `domain: string` - Domain to configure a DNS zone

## Outputs

- `name: string` - Subdomain Name
- `zone_id: string` - Route53 Zone ID of Subdomain
- `nameservers: list(string)` - List of Nameservers for Route53 Zone
- `delegator: object({ name: string, access_key: string, secret_key: string })` 
  - AWS IAM Keys for an AWS user that can alter records within the created domain zone
