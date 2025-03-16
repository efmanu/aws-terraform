# AWS Terraform Infrastructure

This repository contains Terraform configurations to deploy AWS infrastructure including VPC, EC2 instances, and related resources.

## Introduction

This project uses Terraform to provision and manage AWS infrastructure as code. The configuration includes:

- VPC with public and private subnets
- EC2 instances
- Security groups
- Network configuration

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0+)
- AWS CLI configured with appropriate credentials
- AWS account with necessary permissions

## Getting Started

### How to Initialize

1. Clone this repository:
   ```
   git clone git@github.com:efmanu/aws-terraform.git
   cd aws-terraform
   ```

2. Create your `terraform.tfvars` file based on the example:
   ```
   cp terraform.tfvars.example terraform.tfvars
   ```

3. Edit `terraform.tfvars` with your specific configuration values.

4. Initialize Terraform:
   ```
   terraform init
   ```

### How to Apply

1. Review the planned changes:
   ```
   terraform plan
   ```

2. Apply the configuration:
   ```
   terraform apply
   ```

3. Confirm by typing `yes` when prompted.

### How to Destroy

To tear down the infrastructure when no longer needed:

```
terraform destroy
```

Confirm by typing `yes` when prompted.

## Project Structure

```
aws-terraform/
├── .gitignore              # Git ignore file
├── .terraform.lock.hcl     # Terraform dependency lock file
├── README.md               # This documentation file
├── ec2.tf                  # EC2 instance configurations
├── provider.tf             # AWS provider configuration
├── terraform.tfvars        # Variable values (not committed to git)
├── terraform.tfvars.example # Example variable values
├── variables.tf            # Variable declarations
└── vpc.tf                  # VPC and networking configurations
```

## Module Descriptions

### Provider (provider.tf)
Configures the AWS provider with region and authentication details.

### Variables (variables.tf)
Defines all input variables used across the project, including AWS region, VPC CIDR blocks, instance types, etc.

### VPC (vpc.tf)
Creates the Virtual Private Cloud with subnets, route tables, internet gateway, and NAT gateways.

### EC2 (ec2.tf)
Provisions EC2 instances with security groups, network interfaces, and related resources.

## Visualize the Infrastructure

To visualize the infrastructure, you can use the Terraform output command:

```
terraform plan -out=plan.out
terraform show -json plan.out > plan.json
```
Then upload the plan.json to [https://hieven.github.io/terraform-visual/](https://hieven.github.io/terraform-visual/)

## Best Practices

- Never commit `terraform.tfvars` with sensitive information
- Use remote state storage for team environments
- Run `terraform plan` before applying changes
- Tag resources appropriately for cost tracking

## Troubleshooting

If you encounter issues:

1. Ensure AWS credentials are properly configured
2. Verify your VPC and subnet CIDR ranges don't conflict
3. Check that your region supports the requested instance types
4. Confirm you have appropriate IAM permissions

## Contributing

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## License

[MIT License](LICENSE)
