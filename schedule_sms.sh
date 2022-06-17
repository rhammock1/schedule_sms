#!/bin/bash

printf "A file was changed! $(date)\n"

# Loop through each file in the directory
# Ignore all files that are already scheduled
for MODIFIED_FILE_PATH in $(grep -Lr "SCHEDULED" messages); do

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
  printf "$MODIFIED_FILE_PATH scheduled for $SCHEDULED_TIME\n"

  # Append flag to file
  printf "\r\nSCHEDULED\r\n" >> $MODIFIED_FILE_PATH
  printf "$SCHEDULED_TIME" >> $MODIFIED_FILE_PATH
done
