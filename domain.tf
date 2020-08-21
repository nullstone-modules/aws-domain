resource "aws_route53_zone" "this" {
  name = var.domain

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}
