

# Create an SCP that allows access to the allowed VPCs
resource "aws_organizations_policy" "vpc_policy" {
  name    = "vpc_policy"
  content = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "AllowAccessToAllowedVPCs",
        "Effect": "Allow",
        "Action": "ec2:*",
        "Resource": [
          for vpc_id in var.allowed_vpc_ids : "arn:aws:ec2:*:*:vpc/${vpc_id}"
        ],
    "Condition": {
        "ArnEquals": {
            "aws:SourceVpc": [
            for vpc_id in var.allowed_vpc_ids : "arn:aws:ec2:*:*:vpc/${vpc_id}"
            ]
        }
    }
      },
      {
        "Sid": "AllowAccessToDescribeFunctions",
        "Effect": "Allow",
        "Action": "ec2:Describe*"
      }
    ]
  })
}


# Attach the SCP to the root of your AWS organization
resource "aws_organizations_policy_attachment" "vpc_policy_attachment" {
  policy_id = aws_organizations_policy.vpc_policy.id
  target_id = var.target_org_unit
}

# Create a deny SCP that denies access to all other VPCs
resource "aws_organizations_policy" "denied_vpc_policy" {
  name    = "denied_vpc_policy"
  content = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "DenyAccessToAllVPCsExceptAllowedOnes",
        "Effect": "Deny",
        "Action": "ec2:*",
        "Resource": "*",
        "Condition": {
          "StringNotEquals": {
            "aws:sourceVpc": [
              for vpc_id in var.allowed_vpc_ids : "arn:aws:ec2:*:*:vpc/${vpc_id}"
            ]
          }
        }
      }
    ]
  })
}

# Attach the deny SCP to the root of your AWS organization
resource "aws_organizations_policy_attachment" "denied_vpc_policy_attachment" {
  policy_id = aws_organizations_policy.denied_vpc_policy.id
  target_id = var.target_org_unit
}
