##########################################################################
# EC2
#
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html
#
##########################################################################
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

variable "instance_id" {
  type        = string
  description = "Instance id"

  validation {
    condition     = can(regex("^i-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.instance_id))
    error_message = "instance_id not valid."
  }
}

variable "snapshot_id" {
  type        = string
  description = "Snapshot id"

  validation {
    condition     = can(regex("^snap-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.snapshot_id))
    error_message = "snapshot_id not valid."
  }
}

variable "ami_id" {
  type        = string
  description = "AMI id"

  validation {
    condition     = can(regex("^ami-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.ami_id))
    error_message = "ami_id not valid."
  }
}

variable "vol_id" {
  type        = string
  description = "EBS volumen id"

  validation {
    condition     = can(regex("^vol-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.vol_id))
    error_message = "vol_id not valid."
  }
}
