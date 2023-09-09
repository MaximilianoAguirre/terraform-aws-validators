# !/bin/bash

export instance_types=$(./list.sh)
export instance_families=$(echo "$instance_types" | awk -F'.' '{ print $1 }' | uniq | paste -s -d'|' -)
export instance_subtypes=$(echo "$instance_types" | awk -F'.' '{ print $2 }' | uniq | paste -s -d'|' -)

export regex="^(($instance_families)\.($instance_subtypes)$)"
echo $regex
