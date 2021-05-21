data "ns_domain" "this" {
  stack_id = data.ns_workspace.this.stack_id
  block_id = data.ns_workspace.this.block_id
}

resource "aws_route53_zone" "this" {
  name = data.ns_domain.this.dns_name
  tags = data.ns_workspace.this.tags
}
