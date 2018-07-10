#!/bin/bash
# Backup script by Ness version 1.4
# Creates backup directory in your $USER folder
# This script backs up users home folder

SDIR=/home/$USER/
DIR=/home/$USER/backup
BKP=backup_$(date +\%Y-\%m-\%d).tar.gz
FILE=/home/$USER/backup/backup_$(date +%Y-%m-%d).tar.gz
LOG=/home/$USER/backup/log__$(date +%Y-%m-%d).txt

# Creates and adds permisions to a directory
# Add sudo if necessary



 mkdir $DIR



#  touch /home/$USER/backup/log__$(date +%Y-%m-%d).txt
#  chmod 777 /home/$USER/backup/log__$(date +%Y-%m-%d).txt


##########################################################

#Checks if directory exists

if [  -d  $DIR ]; then

        echo "Directory $DIR Exists"

fi

##########################################################

# Starts the compression and backup

echo "Backup started on $(date)"
echo "Compressing files and backing up data"
echo "This won't take long"

tar -zcf  $BKP  $SDIR

mv $BKP $DIR

#Checks if backup was completed

if [ -f $FILE ]; then

echo "Backup was completed on $(date)"

else

echo "Backup Failed on $(date)"

fi

# Checks if backup was created and creates log file

if [ -f $FILE ]; then

 touch $LOG

else

 false

fi

#Adds information to log file otherwise prints an error

if [ -f $FILE ]; then

echo "Backup was completed on $(date)" >> /home/$USER/backup/log__$(date +%Y-%m-%d).txt

else

echo "Log file was not created, exiting"

fi
