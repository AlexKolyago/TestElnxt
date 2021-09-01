#!/bin/bash

db_host=$3
db_port=$5
db_schema=$7
db_user=$9
db_password=${11}

find $1/ -depth -type f -printf "%f\n" -print -exec du -h --time {} + > result.txt

sudo mysql -h $db_host -P $db_port --protocol=tcp --user=$db_user --password=$db_password --local-infile=1 $db_schema << EOF
LOAD DATA LOCAL INFILE '/home/alex/Elinext/result.txt' INTO TABLE test;
EOF


