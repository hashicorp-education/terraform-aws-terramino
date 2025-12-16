# Terramino Terraform module

This Terraform module creates an instance of [terramino-go](https://github.com/hashicorp-education/terramino-go/tree/ssm) running on an EC2 instance in AWS. It reads Redis connection information written to AWS Secrets Manager by the [dedicated Redis no-code module](https://github.com/hashicorp-education/terraform-aws-redis-ec2)
