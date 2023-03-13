#!/usr/bin/bash

if [ "$USER"=="oracle" ] || grep -q "$USER" ./DB.admins.db; then 
	
	echo "list of databases:"
	ls ./Databases
	
	read -p "enter the database name: " db_name
	db_path="./Databases/$db_name"	
	
	if [ ! -d "$db_path" ]; then
		echo "Error: there is no "$db_name" database"
	else
		owner=$(cat "$db_path/owner.txt")
		if [ "$owner" == "$USER" ];then
			rm -rf "$db_path"
			echo "Database deleted successfully."
		else
			echo "you do not have the permission to delete this database"
		fi
	fi
else
	echo "Error: only users in DB_adimns.db can create databases"
fi
