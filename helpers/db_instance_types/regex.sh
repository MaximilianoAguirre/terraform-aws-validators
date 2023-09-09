# !/bin/bash

./list.sh

echo "$engines"

echo "$instance_types"

export regex="^(($instance_families)\.($instance_subtypes)$)"

regex="^db.((($instance_families)\.($instance_subtypes))|serverless)$"
