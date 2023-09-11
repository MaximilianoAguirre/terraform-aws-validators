# Terraform AWS validators

This is a collection of validators for terraform variables based on specific resource identifiers in AWS.

## Supported resources

| Service | Resource             | Type          |                                                                     |
| ------- | -------------------- | ------------- | ------------------------------------------------------------------- |
| Account | Account ID           | string length | [source](#account-id)                                               |
| Account | Account canonical ID | regex         | [source](#account-canonical-id)                                     |
| EC2     | Instance type        | regex         | [source](#ec2-instance-type) \| [helper](./helpers/instance_types/) |
| EC2     | Instance ID          | regex         | [source](#ec2-instance-id)                                          |
| EC2     | Snapshot ID          | regex         | [source](#ec2-snapshot-id)                                          |
| EC2     | AMI ID               | regex         | [source](#ec2-ami-id)                                               |
| EC2     | EBS Volumen ID       | regex         | [source](#ec2-ebs-volume-id)                                        |
| RDS     | DB instance type     | regex         | [source](#instance-type) \| [helper](./helpers/db_instance_types//) |

## Values

### Account id

_Length:_ `12`

_Example:_

```terraform
variable "account_id" {
  type        = string
  description = "Account id"

  validation {
    condition     = try(length(var.account_id) == 12, false)
    error_message = "account_id not valid."
  }
}
```

_References:_

- https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-identifiers.html

### Account Canonical id

_[Regex](https://regex101.com/r/4HHgsB/1):_

```regex
^[a-f0-9]{64}$
```

_Example:_

```terraform
variable "account_canonical_id" {
  type        = number
  description = "Account id"

  validation {
    condition     = can(regex("^[a-f0-9]{64}$", var.account_canonical_id))
    error_message = "account_canonical_id not valid."
  }
}
```

_References:_

- https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-identifiers.html

### EC2 Instance type

_[Regex](https://regex101.com/r/xDUHtV):_

```regex
^((a1|c1|c3|c4|c5|c5a|c5ad|c5d|c5n|c6a|c6g|c6gd|c6gn|c6i|c6id|c6in|c7g|c7gd|c7gn|d2|d3|d3en|dl1|f1|g2|g3|g3s|g4ad|g4dn|g5|g5g|h1|hpc7g|i2|i3|i3en|i4g|i4i|im4gn|inf1|inf2|is4gen|m1|m2|m3|m4|m5|m5a|m5ad|m5d|m5dn|m5n|m5zn|m6a|m6g|m6gd|m6i|m6id|m6idn|m6in|m7a|m7g|m7gd|m7i|m7i-flex|mac1|mac2|p2|p3|p3dn|p4d|p5|r3|r4|r5|r5a|r5ad|r5b|r5d|r5dn|r5n|r6a|r6g|r6gd|r6i|r6id|r6idn|r6in|r7g|r7gd|t1|t2|t3|t3a|t4g|trn1|trn1n|u-12tb1|u-18tb1|u-24tb1|u-3tb1|u-6tb1|u-9tb1|vt1|x1|x1e|x2gd|x2idn|x2iedn|x2iezn|z1d)\.(10xlarge|112xlarge|12xlarge|16xlarge|18xlarge|24xlarge|2xlarge|32xlarge|3xlarge|48xlarge|4xlarge|56xlarge|6xlarge|8xlarge|9xlarge|large|medium|metal|metal-48xl|micro|nano|small|xlarge)$)
```

_Example:_

```terraform
variable "instance_type" {
  type        = string
  description = "Instance type"

  validation {
    condition = can(
      regex("^((a1|c1|c3|c4|c5|c5a|c5ad|c5d|c5n|c6a|c6g|c6gd|c6gn|c6i|c6id|c6in|c7g|c7gd|c7gn|d2|d3|d3en|dl1|f1|g2|g3|g3s|g4ad|g4dn|g5|g5g|h1|hpc7g|i2|i3|i3en|i4g|i4i|im4gn|inf1|inf2|is4gen|m1|m2|m3|m4|m5|m5a|m5ad|m5d|m5dn|m5n|m5zn|m6a|m6g|m6gd|m6i|m6id|m6idn|m6in|m7a|m7g|m7gd|m7i|m7i-flex|mac1|mac2|p2|p3|p3dn|p4d|p5|r3|r4|r5|r5a|r5ad|r5b|r5d|r5dn|r5n|r6a|r6g|r6gd|r6i|r6id|r6idn|r6in|r7g|r7gd|t1|t2|t3|t3a|t4g|trn1|trn1n|u-12tb1|u-18tb1|u-24tb1|u-3tb1|u-6tb1|u-9tb1|vt1|x1|x1e|x2gd|x2idn|x2iedn|x2iezn|z1d)\\.(10xlarge|112xlarge|12xlarge|16xlarge|18xlarge|24xlarge|2xlarge|32xlarge|3xlarge|48xlarge|4xlarge|56xlarge|6xlarge|8xlarge|9xlarge|large|medium|metal|metal-48xl|micro|nano|small|xlarge)$)",
      var.instance_type)
    )
    error_message = "instance_type not valid."
  }
}
```

### EC2 Instance ID

_Regex:_

```regex
^i-[a-f0-9]{8}(?:[a-f0-9]{9})?$
```

_Example:_

```terraform
variable "instance_id" {
  type        = string
  description = "Instance id"

  validation {
    condition     = can(regex("^i-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.instance_id))
    error_message = "instance_id not valid."
  }
}
```

_References:_

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html

### EC2 Snapshot ID

_[Regex](https://regex101.com/r/t84EIN):_

```regex
^snap-[a-f0-9]{8}(?:[a-f0-9]{9})?$
```

_Example:_

```terraform
variable "snapshot_id" {
  type        = string
  description = "Snapshot id"

  validation {
    condition     = can(regex("^snap-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.snapshot_id))
    error_message = "snapshot_id not valid."
  }
}
```

_References:_

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html

### EC2 AMI ID

_[Regex](https://regex101.com/r/XutkE3):_

```regex
^ami-[a-f0-9]{8}(?:[a-f0-9]{9})?$
```

_Example:_

```terraform
variable "ami_id" {
  type        = string
  description = "AMI id"

  validation {
    condition     = can(regex("^ami-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.ami_id))
    error_message = "ami_id not valid."
  }
}
```

_References:_

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html

### EC2 EBS volume ID

_[Regex](https://regex101.com/r/HX4XFb):_

```regex
^vol-[a-f0-9]{8}(?:[a-f0-9]{9})?$
```

_Example:_

```terraform
variable "vol_id" {
  type        = string
  description = "EBS volumen id"

  validation {
    condition     = can(regex("^vol-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.vol_id))
    error_message = "vol_id not valid."
  }
}
```

_References:_

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html

### RDS Instance type

_Regex:_

```regex
^db.((($instance_families)\\.($instance_subtypes))|serverless)$
```

_Example:_

```terraform
variable "db_instance_type" {
  type        = string
  description = "DB instance type"

  validation {
    condition = can(
      regex("^db.((($instance_families)\\.($instance_subtypes))|serverless)$",
      var.db_instance_type)
    )
    error_message = "db_instance_type not valid."
  }
}
```
