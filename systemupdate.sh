#!/bin/bash

# Script to update, upgrade, clear and log the system

# For Debian based systems such as Ubuntu change dnf to apt-get

#Creat a log file

LOGFILE="/var/log/systemmaintenance.log"
TIMESTAMP=$(date +"%y-%m-%d %T")


#Creat function to log


log() {
local message="$1"
echo "$TIMESTAMP: $message" | tee -a $LOGFILE
}

#Size of the system before cleanup


log "checking the size of the system before maintenance..." 

df -h / | awk 'NR==1 || NR==2 {print $2, $3, $4}'

if [ $? -ne 0 ]; then
	log "Error checking diskspace. df command failed. "
	exit 1
fi

# Update the system

log "Updating the system..."

dnf update -y > /dev/null 2>&1

if [ $? -ne 0 ]; then
    log "Error during dnf update... Contact your administrator"
    exit 1
else
    log "Update complete..."
fi

# Upgrading the system

log "Upgrading the System..."
dnf upgrade -y > /dev/null 2>&1

if [ $? -ne 0 ]; then 
	log "Error during dnf update... Contact your administrator"
	exit 1
else
	log "Ugrade complete..."
fi

# Cleaning dnf chache

log "Cleaning dnf cache..."
dnf clean all -y > /dev/null 2>&1

if [ $? -ne 0 ]; then
	log "Error during dnf clean... contact your administrator"
	exit 1
else 
	log "Dnf cleaning complete..."
fi

# Remove old kernels
log "Removing old kernels.."

dnf remove $(rpm -q kernel --last | grep -v $(uname -r)) -y > /dev/null 2>&1

if [ $? -ne 0 ]; then
	log "Error removing old kernels"
else
	log "Old kernels removed..."
fi


#Size of the system after  cleanup


df -h / | awk 'NR==1 || NR==2 {print $2, $3, $4}' | tee -a $LOGFILE

if [ $? -ne 0 ]; then
	log "Error checking disk size.."
	exit 1
fi

log "System maintenance complete."
exit 0
