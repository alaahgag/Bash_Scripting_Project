#!/usr/bin/bash

if [ "$USER"=="oracle" ] || grep -q "$USER" ./DB.admins.db; then 
	echo "list of Databases:"
	ls ./Databases
	
	read -p "enter database name: " db_name	
	db_path="./Databases/$db_name"
	
	if [ ! -d "$db_path" ];then
		echo "the "$db_name" database is not exist"
	else
		owner=$(cat "$db_path/owner.txt")
		if [ "$owner" = "$USER" ]; then
			read -p "enter table name: " tb_name
			tb_path="$db_path/$tb_name.table"
			if [ -f "tb_path" ]; then
				echo "the table is already exists"
			else
				read -p "enter the number of the columns: " num_col
				columns=""
				for ((i=1;i<=num_col;i++)); do
					read -p "enter column $i name: " col_name
					columns="$columns$col_name,"
				done
				columns=${columns%,}
				echo "$columns" > "$tb_path"
				echo "Table created successfully."
			fi
		else 
			echo "you don not have the permission to create table"
		fi
	fi
	
else
	echo "Error: only users in DB_adimns.db can create databases"
fi
