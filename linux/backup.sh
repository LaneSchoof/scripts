#!/bin/bash

#Create backup directory
mkdir -p/var/backup

#Create backup files
tar cvf /var/backup/home.tar /home 

#Move backup file with date
todayDate=$(date +%m%d%Y)
mv /var/backup/home.tar /var/backup/home.$todayDate'.tar'

#List all backup files and create logs at /var/backup/file_report.txt
ls -lh /var/backup >> /var/backup/file_report.txt

#Create a report how much free memory is left at /var/backup/disk_report.txt
free -h >> /var/backup/disk_report.txt


