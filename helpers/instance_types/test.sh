# !/bin/bash

./regex.sh

echo "$instance_types" | xargs -I{} bash -c '[[ {} =~ $regex ]] && echo "matched: {}" || (echo "failed: {}" && exit 1)'
