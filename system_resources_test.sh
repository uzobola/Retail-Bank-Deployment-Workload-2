#!/bin/bash
#set -x


# Create a BASH script called "system_resources_test.sh" that checks for system resources 
# (can be memory, cpu, disk, all of the above and/or more) and push it to the GH repo. 
# IMPORTANT: make sure you use conditional statements and exit codes (0 or 1) if any resource exceeds a certain threshold



# Thresholds
CPU_THRESHOLD=70
MEMORY_THRESHOLD=70
DISK_THRESHOLD=70

echo " "
echo "# CPU USAGE"
echo "#-----------------------------------------------------------------------"
# This Checks the percentage of CPU Time spent Idle
# Sometimes, top does not return the right values when it is refreshing. This handles that by 
# trying to fetch CPU idle percentage until it get a valid number value
while true; do
    CPU_IDLE=$( top -bn1 | grep '%Cpu(s)' | awk '{print $8}' )
    if [[ $CPU_IDLE =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        break
    fi
    echo "Invalid CPU Idle value ('$CPU_IDLE'). Retrying..."
    sleep 1
done


echo "The CPU Idle % is: ('$CPU_IDLE')" 
echo " "

# Checks CPU usage by subtracting the idle percentage from 100
CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
            echo "CPU usage exceeds threshold: $CPU_USAGE%"
            EXIT_CODE=1
    else
        echo "CPU usage is within threshold: $CPU_USAGE%"
    fi



echo " "
echo " "
echo "# MEMORY STATS"
echo "-------------------------------------------------------------------"
# This Gives You Memory Stats
echo "Total Memory: " $(free -h | grep Mem | awk '{print $2}')
echo "Used Memory: " $(free -h | grep Mem | awk '{print $3}')
echo "Available Memory: " $(free -h | grep Mem | awk '{print $7}')
echo " "

# Checks Memory Usage Threshold
# It Calculates the % of Used Memory by Dividing the Used Memory by the Total Memory to give the Percentage 
MEMORY_USAGE=$(free -h | grep Mem | awk '{print $3/$2 * 100.0}')
    if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
        echo "Memory usage is above threshold: $MEMORY_USAGE%"
       EXIT_CODE=1
    else
        echo "Memory usage is within threshold: $MEMORY_USAGE%"
    fi



echo " "
echo " "
echo "# DISK STATS"
echo "-------------------------------------------------------------------------"
# This Checks Available Disk Space
echo " Total Disk Space Size:"$(df -h / | awk '{print $2}')
echo " Disk Space Used:"$(df -h / | awk '{print $3}')
echo " Disk Space  Available:"$(df -h / | awk '{print $4}')
echo " "

# Check disk usage
DISK_USED=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//g')
    if (( "$DISK_USED" > "$DISK_THRESHOLD" )); then
        echo "Disk usage is above threshold: $DISK_USED%"
        EXIT_CODE=1
    else
        echo "Disk usage is within threshold: $DISK_USED%"
        EXIT_CODE=0
    fi

echo " "
