# Create the Admin User
resource "aws_iam_user" "admin_user" {
  name = "admin_user"
}

resource "aws_iam_user_policy_attachment" "admin_policy_attachment" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create the tfuser
resource "aws_iam_user" "tfuser" {
  name = "tfuser"
}

# Attach multiple policies to tfuser
resource "aws_iam_user_policy_attachment" "tfuser_policy_attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ])
  user       = aws_iam_user.tfuser.name
  policy_arn = each.value
}

# Generate Access Key and Secret Key for tfuser
resource "aws_iam_access_key" "tfuser_key" {
  user = aws_iam_user.tfuser.name
}

# Output Access Key and Secret Key for tfuser
output "tfuser_access_key" {
  value       = aws_iam_access_key.tfuser_key.id
  description = "Access Key for tfuser"
}

output "tfuser_secret_key" {
  value       = aws_iam_access_key.tfuser_key.encrypted_secret
  description = "Secret Key for tfuser"
  sensitive   = false
}

resource "aws_budgets_budget" "aws_budget" {
    name = "budget-monthly"
    budget_type = "COST"
    limit_amount = "12"
    limit_unit = "USD"
    time_unit = "MONTHLY"

    notification {
        comparison_operator = "GREATER_THAN"
        threshold                  = 100
        threshold_type             = "PERCENTAGE"
        notification_type          = "ACTUAL"
        subscriber_email_addresses = ["test@example.com"]
      
    }
}