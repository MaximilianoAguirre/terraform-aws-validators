# Terraform AWS validators

This is a collection of validators for terraform variables based on specific resource identifiers in AWS.

## Supported resources

| Service | Resource             | Type          |                                                                      |
| ------- | -------------------- | ------------- | -------------------------------------------------------------------- |
| Account | Account ID           | string length | [example](./account.tf#L7-L15)                                       |
| Account | Account canonical ID | regex         | [example](./account.tf#L17-L25) / [value](./#L24-#L26)               |
| EC2     | Instance type        | regex         | [example](./ec2.tf#L7-L18) / [helper](./helpers/instance_types/)     |
| EC2     | Instance ID          | regex         | [example](./ec2.tf#L20-L28)                                          |
| EC2     | Snapshot ID          | regex         | [example](./ec2.tf#L30-L38)                                          |
| EC2     | AMI ID               | regex         | [example](./ec2.tf#L40-L48)                                          |
| EC2     | EBS Volumen ID       | regex         | [example](./ec2.tf#L50-L58)                                          |
| RDS     | DB instance type     | regex         | [example](./rds.tf#L4-L16) / [helper](./helpers/db_instance_types//) |

## Raw values

### Account

Canonical id

```regex
^[a-f0-9]{64}$
```
