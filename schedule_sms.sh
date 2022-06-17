#!/bin/bash

#  Current limitation is that only one message can be sent per minute.
#  LaunchCtl only knows the directory was modified
#
#
#
#
#

printf "A file was changed! $(date)\n"

MODIFIED_FILE_PATH="messages/$(ls -Art messages/ | tail -1)"

# Check if file has been scheduled
if [ $(grep "SCHEDULED" "$MODIFIED_FILE_PATH") ]; then
    printf "File already scheduled"
    exit 0
fi

# Parse file for date and time
DATE=$(grep "Date:" "$MODIFIED_FILE_PATH" | cut -d ' ' -f 2)
TIME=$(grep "Time:" "$MODIFIED_FILE_PATH" | cut -d ' ' -f 2)

# Read date and time into arrays
IFS='-' read -a DATE_ARRAY <<< "$DATE" 
IFS=':' read -a TIME_ARRAY <<< "$TIME"

# Format date and time for at command
# [[CC]YY]MMDDHHMM[.SS]]]]
SCHEDULED_TIME=''
for i in ${DATE_ARRAY[@]}; do
    SCHEDULED_TIME="$SCHEDULED_TIME${i//[$'\t\r\n ']}"
done
for i in ${TIME_ARRAY[@]}; do
    SCHEDULED_TIME="$SCHEDULED_TIME${i//[$'\t\r\n ']}"
done

# Schedule message
at -t $SCHEDULED_TIME -f send_sms.sh

# Append flag to file
printf "\r\nSCHEDULED\r\n" >> $MODIFIED_FILE_PATH
printf "$SCHEDULED_TIME" >> $MODIFIED_FILE_PATH