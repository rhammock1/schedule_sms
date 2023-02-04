#!/bin/bash

# Find the correct file
FILE_PATH=$(grep -r "$(date +'%Y%m%d%H%M')" messages | cut -d ':' -f 1)

# Parse file for message and contact
MESSAGE=$(grep "Message:" "$FILE_PATH" | cut -d "\"" -f 2)
CONTACT=$(grep "Contact:" "$FILE_PATH" | cut -d ' ' -f 2)

if [ -z $"CONTACT" ]; then
  title="Scheduled Message Sent"
  subtitle="SMS"
  message="SMS that was scheduled was sent."

  osascript -e "display notification \"$message\" with title \"$title\" subtitle \"$subtitle\""
else
  # Only keep the numbers
  NUMBER=${CONTACT//[^[:digit:].-]/}

  # Send message
  osascript -e "tell application \"Messages\" to send \"$MESSAGE\" to buddy \"$NUMBER\""
fi
# Delete file
# While testing, just append delivered and timestamp to file
printf "\r\nDELIVERED\r\n" >> $FILE_PATH
printf "$(date +'%Y%m%d%H%M%S')" >> $FILE_PATH