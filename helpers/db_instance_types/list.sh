# !/bin/bash

# Get all engines for the region
export engines=$(aws rds describe-db-engine-versions --query "DBEngineVersions[*].[Engine]" --output text --region us-east-1 | sort | uniq)

# Query all instance types for the queried RDS engines
export instance_types=$(echo "$engines" | xargs -I{} bash -c 'aws rds describe-orderable-db-instance-options --query "OrderableDBInstanceOptions[*].[DBInstanceClass]" --engine aurora-mysql --output text --region us-east-1 | sort -u' | sort -u)
