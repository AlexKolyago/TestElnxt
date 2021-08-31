#!/bin/bash

if [ $# = 1 ]; then

	sed -e "s/{{hostname}}/$(hostname)/g;
	s/{{ip}}/$(hostname  -I | cut -f1 -d' ')/g;
	s/{{current_date}}/$(date "+%H:%M:%S %d.%m.%Y")/g;
	s|{{home_folder}}|$HOME|g;
	s/{{username}}/$(whoami)/g;
	s/{{first_name}}/John/g;
	s/{{last_name}}/Doe/g" input.yml | tee output.yml

else

	sed -e "s/{{hostname}}/$(hostname)/g;
	s/{{ip}}/$(hostname  -I | cut -f1 -d' ')/g;
	s/{{current_date}}/$(date "+%H:%M:%S %d.%m.%Y")/g;
	s|{{home_folder}}|$HOME|g;
	s/{{username}}/$(whoami)/g;
	s/{{first_name}}/$3/g;
	s/{{last_name}}/$5/g" input.yml | tee output.yml

fi
