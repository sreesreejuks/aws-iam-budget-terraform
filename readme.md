# AWS IAM Users and Budget Configuration with Terraform

This Terraform script helps you create two AWS IAM users (Admin and tfuser), attach the necessary policies to them, and configure an AWS budget with email notifications. It also generates an access key and secret key for the `tfuser`.

## Features

- **Create IAM Users**: Creates two IAM users, one with full administrative access and another with full access to EC2 and S3.
- **Attach Policies**: Automatically attaches predefined AWS IAM policies to both users.
- **Access Key and Secret Key**: Generates an access key and secret key for `tfuser` and outputs them.
- **Budget Setup**: Sets up a budget in AWS with a monthly cost limit of 12 USD and a notification threshold at 100%.

## Prerequisites

- **Terraform**: You must have Terraform installed. If not, install it from [terraform.io](https://www.terraform.io/).
- **AWS CLI Configuration**: Make sure your AWS CLI is configured with the necessary access rights to manage IAM and budgets.

## Setup

1. Clone the repository:
    ```bash
    git clone https://gitlab.com/your-username/repository-name.git
    cd repository-name
    ```

2. Initialize the Terraform configuration:
    ```bash
    terraform init
    ```

3. Run the Terraform plan to check the resources that will be created:
    ```bash
    terraform plan
    ```

4. Apply the configuration:
    ```bash
    terraform apply
    ```

    This will create the IAM users, attach policies, generate access keys, and set up the budget.

## Outputs

- `tfuser_access_key`: The access key ID for the `tfuser`.
- `tfuser_secret_key`: The secret key for the `tfuser` (Note: This will not be shown after Terraform execution for security reasons, so make sure to note it down when displayed).

## Cleaning Up

To remove the resources created by Terraform, use the following command:

```bash
terraform destroy
