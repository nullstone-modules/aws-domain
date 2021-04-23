data "ns_domain" "this" {
  stack = data.ns_workspace.this.stack
  block = data.ns_workspace.this.block
}

resource "aws_route53_zone" "this" {
  name = data.ns_domain.this.dns_name
  tags = data.ns_workspace.this.tags
}
