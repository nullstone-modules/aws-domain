locals {
  delegator = {
    role_arn         = aws_iam_role.delegator.arn
    session_duration = 3600 // 1 hour
  }
}

resource "aws_iam_role" "delegator" {
  name               = "dns-delegator-${local.resource_name}"
  tags               = local.tags
  assume_role_policy = data.aws_iam_policy_document.delegator_assume.json
}

data "aws_iam_policy_document" "delegator_assume" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:SetSourceIdentity",
      "sts:TagSession",
    ]

    principals {
      type        = "AWS"
      identifiers = [local.ns_agent_user_arn]
    }
  }
}

resource "aws_iam_role_policy" "delegator" {
  name   = "AllowDNSDelegation"
  role   = aws_iam_role.delegator.name
  policy = data.aws_iam_policy_document.delegator.json
}

data "aws_iam_policy_document" "delegator" {
  statement {
    sid    = "ReadDomainZone"
    effect = "Allow"

    actions = [
      "route53:GetHostedZone", // TF needs to build the record
    ]

    resources = ["arn:aws:route53:::hostedzone/${aws_route53_zone.this.zone_id}"]
  }

  statement {
    sid    = "AlterRecordsInDomainZone"
    effect = "Allow"

    actions = [
      "route53:ChangeResourceRecordSets",
      "route53:ListResourceRecordSets",
    ]

    resources = ["arn:aws:route53:::hostedzone/${aws_route53_zone.this.zone_id}"]
  }

  // This statement is used to monitor changes that are issued as batch changes through ChangeResourceRecordSets
  // It's impossible to know the resource ARN because the ID is created for every batch change
  statement {
    sid    = "MonitorRecordChanges"
    effect = "Allow"

    actions = [
      "route53:GetChange"
    ]

    resources = ["*"]
  }
}
