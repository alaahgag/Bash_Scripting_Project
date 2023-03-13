#!/usr/bin/bash

if grep -q "$USER" ./DB_admins.db; then
	
	echo "select the user that you want to delete: "
	cat ./DB_admins.db

	read -p "enter which user you want to delete: " name

	if [ "$name" == "oracle" ];then
		echo "Error: oracle can not be deleted"
	else
		sed -i "/$name/d" ./DB_admins.db
	fi
else
	echo "Error: only users in DB_admins.db can delete a user"
fi
