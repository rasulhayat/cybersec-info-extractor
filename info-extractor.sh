#!/bin/bash
echo "----------------------------START OF SCRIPT---------------------------------"
#display project title and description
echo -e "\n"
echo "Project : Info Extractor"
echo -e "\n"
echo "System Diagnostics"
echo "----------------------------------------------------------------------------------"
echo "1)	System’s public IP."
echo -e "\n"

#define public ip variable by invoking curl prompt
#-s flag, silent, used to omit the HTTP POST data
publicIP=$(curl -s ifconfig.io)

#display text for user
echo "	Public IP: $publicIP"

echo -e "\n"
echo "----------------------------------------------------------------------------------"
echo "2)	Private IP address assigned to the system’s network interface."
echo -e "\n"

#define private ip assigned to system's NIC by invoking ifconfig
#grep used to filter the line, awk used to parse the IP address
privateIP=$(ifconfig | grep broadcast | awk '{print $2}')

#display text for user
echo "	Private IP: $privateIP"

echo -e "\n"
echo "----------------------------------------------------------------------------------"
echo "3)	Masked device MAC address."
echo -e "\n"

#define mac address
macAddr=$(ifconfig | grep ether | awk '{print $2}')
#define var for masked mac address
maskedMacAddr=$(echo $macAddr | awk -F: '{print $1":"$2":"$3":**:**:**"}')
#display text for user
echo "	MAC Address: $maskedMacAddr"

echo -e "\n"
echo "----------------------------------------------------------------------------------"
echo "4)	Percentage of CPU usage for the top 5 processes. Wait for 5s."
echo -e "\n"

#display top 5 cpu usage by invoking the top prompt and trimming using head/tail
top5cpu=$(top | head -n 12 | tail -n 6)
echo "$top5cpu"

echo -e "\n"
echo "----------------------------------------------------------------------------------"
echo "5)	Memory usage statistics: total and available memory."
echo -e "\n"

#filter and display for total memory using grep and awk
# -h flag to sisplay human readable memory
totalMemory=$(free -h| grep "Mem:" | awk '{print $2}')
echo "	Total memory: $totalMemory"

#filter and display for available memory using grep and awk
availMemory=$(free -h| grep "Mem:" | awk '{print $7}')
echo "	Available memory: $availMemory"

echo -e "\n"
echo "----------------------------------------------------------------------------------"
echo "6)	Active system services with their status. Press 'q' to quit and proceed to next task."
echo -e "\n"

#display active system services with their status
# --type flag to filter to service, --state to show active services
systemctl --type=service --state=active

echo -e "\n"
echo "----------------------------------------------------------------------------------"
echo "7)	Location of the top 10 largest files in /home."
echo -e "\n"

#display location of the top 10 largest files in /home
#2>/dev/null to remove error messages, -exec , {} placeholder of current find line, '+' to append current find.
# sort -r flag is to reverse find ( descending order ), sort -h to sort according to human-readable file size
# head to show first 10 lines
find /home -type f 2>/dev/null -exec du -h {} + | sort -rh | head 

echo -e "\n"
echo "----------------------------END OF SCRIPT-----------------------------------"
