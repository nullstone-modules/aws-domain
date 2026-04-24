variable "nullstone_delegators" {
  type        = list(string)
  default     = []
  description = <<EOF
Add the ARN of each "Nullstone Agent" role to this list. (These are listed in "Cloud Accounts" in Nullstone.)
Each "Nullstone Agent" listed will be able to assume the delegator role to create subdomains off the main domain.
Typically, this is a list of role ARNs (e.g. `arn:aws:iam::<account-id>:role/nullstone`) for each AWS account.
EOF
}
