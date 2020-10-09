resource "aws_route53_zone" "this" {
  name = var.domain
  tags = data.ns_workspace.this.tags
}
