# Terraform AWS validators

This is a collection of validators for terraform variables based on specific resource identifiers in AWS.

## Supported resources

| Service | Resource             | type          |                                                                     |
| ------- | -------------------- | ------------- | ------------------------------------------------------------------- |
| Account | Account ID           | string length | [source](./account.tf#L7-L15)                                       |
| Account | Account canonical ID | regex         | [source](./account.tf#L17-L25)                                      |
| EC2     | Instance type        | regex         | [source](./ec2.tf#L7-L18) / [helper](./helpers/instance_types/)     |
| EC2     | Instance ID          | regex         | [source](./ec2.tf#L20-L28)                                          |
| EC2     | Snapshot ID          | regex         | [source](./ec2.tf#L30-L38)                                          |
| EC2     | AMI ID               | regex         | [source](./ec2.tf#L40-L48)                                          |
| EC2     | EBS Volumen ID       | regex         | [source](./ec2.tf#L50-L58)                                          |
| RDS     | DB instance type     | regex         | [source](./rds.tf#L4-L16) / [helper](./helpers/db_instance_types//) |
