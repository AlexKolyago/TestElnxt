#!/bin/bash

current_temp=$(find $1/ -depth -type f -printf "%f\n" -print -exec du -h --time {} +)
echo "$current_temp"

mysql -h localhost -P 3306 --protocol=tcp --user=root --password=7034 test << EOF
INSTERT INTO test (files) VALUES ($current_temp);
EOF
