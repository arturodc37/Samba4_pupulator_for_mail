#!/bin/bash

@echo off
clear

echo "**********************************************                                   HOW TO USE:"
echo "**********************************************"
echo "*                                            *"
echo "*   WELCOME TO SAMBA4-TRANSFER-UTILITY       *             WHEN ASKED WRITE THE FULL PATH TO THE FILE TO MIGRATE TO SAMBA4"
echo "*                                            *"
echo "**********************************************             THE FILE MUST HAVE THE FOLLOWING FORMAT:"
echo "**********************************************"

echo "**********************************************             NAME:PASSWORD:MAIL"
echo "**********************************************"
echo "*                                            *             EXAMPLE FORMAT:"
echo "*         MADE WITH LOVE AND BRAIN           *             ALEXIS_PEREZ_GONZALEZ:ALEXIS1234:alexis.gonzalez@work.com"
echo "*                                            *"
echo "*                                            *"
echo "**********************************************             CAUTION!!!: A FILE WITH BLANK SPACES MAY CAUSE SCRIPT-MALFUNCTION"
echo "**********************************************"

echo "**********************************************"
echo "**********************************************             AUTOR NOTES:"
echo "*                                            *             YOU ARE FREE TO MODIFY THIS SCRIPT AN ADD MORE DATA TO THE TRANSFER"
echo "*    Credits:arturo.havana993@gmail.com      *             FORMAT. SEE THE COMMENTED ZONE IN THE SCRIPT."
echo "*                                            *             GOOD LUCK!!"
echo "**********************************************"
echo "**********************************************"



read -p "Enter full path to file: " data
echo "Path recorded!!"
echo " "
echo "WARNING!! Samba needs a stronger user password  WARNING!!"
echo " "
echo "You must add a prefix to actual user password to make it stronger"
echo " "
echo "Prefix example: something_1234"
echo " "
read -p "Do you want to add a prefix??. (Y/n): " verifier1

if [[ "${verifier1}" = "n" ]] ; then
clear
echo " "
echo " "
echo "WITH A WEAK PASSWORD THE PROCESS WILL NOT CONTINUE!!"
echo " "
echo " "
exit
fi

echo " "
read -p "Enter a prefix: " prefix
echo " "
read -p "Do you want to start the process??. (Y/n): " verifier2

if [[ "${verifier2}" = "n" ]] ; then
clear
echo " "
echo " "
echo "PROCESS TERMINATED BY USER!"
echo " "
echo " "
exit
fi

echo "The process will start in:"
echo -ne "-->5" && sleep 1 && echo -ne " -->4" && sleep 1 && echo -ne " -->3" && sleep 1 && echo -ne " -->2" && sleep 1 && echo -ne " -->1" && sleep 1 && echo -ne " --> STARTING..."
sleep 2;
echo " "
echo " "
echo "  STARTING PROCESS AT:"
echo " "
date
echo " "
echo " "

counter=0
data2=$(cat $data)

for values in $data2; do

name=$(echo $values | cut -d ':' -f1)
password=$(echo $values | cut -d ':' -f2)
mail=$(echo $values | cut -d ':' -f3)


###ZONE TO MODIFY IF YOU WANT TO EXPORT OTHER DATA TO SAMBA
###OF COURSE YOU MUST ADD THE NEW VARIABLES


echo samba-tool user create $name $prefix$password --given-name=$name --mail-address=$mail


###

echo USER $name CREATED SUCCESSFULLY!!!

sleep 2;
((counter++))
done


echo " "
echo " "
echo " "
echo " "
echo "********************************"
echo " PROCESS COMPLETED AT:"
echo " "
date
echo " "
echo " RESULTS:"
echo " "
echo " $counter USERS has been added!"
echo " "
echo " "
echo "********************************"
echo " "
echo " "

####END####
