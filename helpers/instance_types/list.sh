# !/bin/bash

aws ec2 describe-instance-types --query "InstanceTypes[*].[InstanceType]" --output text --region us-east-1 --profile renaiss | sort
