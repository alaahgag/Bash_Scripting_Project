#!/usr/bin/bash

if grep -q "$USER" ./DB_admins.db; then
	read -p "enter the database name: " db_name
	
	mkdir -p ./Databases/"$db_name"
	
	echo "$USER" > ./Databases/"$db_name"/owner.txt
	
else
	echo "Error: only users in DB_adimns.db can create databases"
fi
