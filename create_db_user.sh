#!/usr/bin/bash

#check if the current user is oracle or admin user
if [ "$USER" == "oracle" ] || grep -q "$USER" ./DB_admins.db; then
	# ask user to enter the new user name
       	read -p "enter the new database user: " new_user

	#check if the new admin user already exists in DB_admins
	if grep -q "$new_user" ./DB_admins.db; then
	 	 echo "the user is already exists"
	else
		#Add new admin user to the DB_admin
		echo "$new_user" >> DB_admins.db	
	fi
else

	echo "Error: only oracle and user admin can create a new database user"
fi	
