# block-aws-domain

Nullstone Block standing up a domain in AWS Route53.

## Inputs

- `owner_id: string` - Stack Owner ID
- `stack_name: string` - Stack Name
- `block_name: string` - Block Name
- `parent_block: string` - Parent Block
- `env: string` - Environment Name
- `backend_conn_str: string` - Connection string for postgres backend

- `domain: string` - Domain to configure a DNS zone

## Outputs

- `name: string` - Subdomain Name
- `zone_id: string` - Route53 Zone ID of Subdomain
- `nameservers: list(string)` - List of Nameservers for Route53 Zone
- `delegator: object({ name: string, access_key: string, secret_key: string })` 
  - AWS IAM Keys for an AWS user that can alter records within the created domain zone
