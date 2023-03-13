#!usr/bin/bash

#Read from the uesr
PS3="Please choose one of hte following options to be excuted: "

#making the choices for the user
select n in "Create Database user" "Delete Database User" "Create new Database" "Delete an existing Database" "Create A new Table inside Database" "Insert A New Row in a Table" "Select Data from Table" "Delete Row from Table"
do 
	case $REPLY in
		#creating database user
		1) ./create_db_user.sh;;
		# delete the the user's database
		2) ./delete_db_user.sh;;
		# create new database for the user
		3) ./create_new_db.sh;;
		# delete existing database 
		4) ./delete_existing_db.sh;;
		# create new table
		5) ./create_new_table.sh;;
		# insert new row to the database
		6) ./insert_new_row.sh;;
		# select a specific data from the database
		7) ./select_data.sh;;
		# delete specific row from the table
		8) ./delete_row_from_table.sh;;
		*) echo "the number you entered is out the range";;

	esac
done

