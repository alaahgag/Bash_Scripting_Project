#!/usr/bin/bash

if [ "$USER"=="oracle" ] || grep -q "$USER" ./DB.admins.db; then 
	echo "list of Databases:"
	ls ./Databases
	
	read -p "enter database name: " db_name	
	db_path="./Databases/$db_name"
	
	if [ ! -d "$db_path" ];then
		echo "the "$db_name" database is not exist"
	else
	
		echo "the tables inside "$db_name" is: "
		ls "./$db_path/"
		
		read -p "enter table name: " tb_name
		tb_path="$db_path/$tb_name.table"
		
		if [ ! -f "$tb_path" ];then
			echo "the table "$tb_name" does not exist"
		else
			echo "1) show the content of the table."
			echo "2) search in table"
			read -p "entre your choice: " select_choice
			
			case "$select_choice" in 
				1) cat "$tb_path";;
				2) read -p "enter your stringsearch: " strsearch
					grep -i "$strsearch" "$tb_path";;
				*) echo "Invalid choice, try again";;
			esac
		fi
	fi
	
else
	echo "Error: only users in DB_adimns.db can create databases"
fi
