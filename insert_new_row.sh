#!/usr/bin/bash

if [ "$USER"=="oracle" ] || grep -q "$USER" ./DB.admins.db; then 
	echo "list of Databases:"
	ls ./Databases
	
	read -p "enter the database name: " db_name	
	db_path="./Databases/$db_name"
	
	if [ ! -d "$db_path" ];then
		echo "the "$db_name" database is not exist"
	else
		owner=$(cat "$db_path/owner.txt")
		if [ "$owner" = "$USER" ]; then
			echo "the tables inside "$db_name" is: "
			ls "./$db_path/"
			
			read -p "enter table name: " tb_name
			tb_path="$db_path/$tb_name.table"
			typeset -i num_fields=$(awk -F',' '{print NF; exit}' "$tb_path")
			values=""
			for ((i=1;i<=num_fields;i++));do
				read -p "enter the value of the $i: " val
				values="$values$val,"
			done
			values=${values%,}
			data=$(echo $values | tr ',' ' ')
			unique_iden=${data[0]}
			if grep -q "$unique_iden" "$tb_path";then
				echo "Error: the id field must be unique"
			else
				echo "$values" >> "$tb_path"
				echo "the values is added successfully"
			fi
			
		else 
			echo "you don not have the permission to create table"
		fi
	fi
	
else
	echo "Error: only users in DB_adimns.db can create databases"
fi
