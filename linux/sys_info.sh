#!/bin/bash

echo -e "Group B $(date)\n"
echo -e "This is the info for the machine $(uname)\n"
echo -e "This is the machine type $MACHTYPE\n"
echo -e "This is the IP Address of the machine $(ip addr | head -n 9 | tail -n 1)\n" >> ~/research/sysinfo.txt
echo -e "This is the Hostname of the machine $HOSTNAME\n" >> ~/research/sysinfo.txt
echo -e "DNS info $(cat /etc/resolv.conf)\n" >> ~/research/sysinfo.txt
echo -e "Memory Info $(free-m)\n" >> ~/research/sysinfo.txt
echo -e "CPU info $(lscpu)\n" >> ~/research/sysinfo.txt
echo -e "Disk Usage $(df -h)\n" >> ~/research/sysinfo.txt
echo -e "Who is logged in $(who)\n" >> ~/research/sysinfo.txt
mkdir ~/research
echo -e  "find 777 files $(find /home -type f -perm 777 >> ~/research/sysinfo.txt
