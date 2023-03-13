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
                        
			read -p "enter deletestring: " del_string
			sed -i "/$del_string/d" "$tb_path"
			echo "the row is deleted successfully"

                else
                        echo "you don not have the permission to create table"
                fi
        fi

else
        echo "Error: only users in DB_adimns.db can create databases"
fi

