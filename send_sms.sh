#!/bin/bash

# Find the correct file
FILE_PATH=$(grep -r "$(date +'%Y%m%d%H%M')" messages | cut -d ':' -f 1)

# Parse file for message and contact
MESSAGE=$(grep "Message:" "$FILE_PATH" | cut -d "'" -f 2)
CONTACT=$(grep "Contact:" "$FILE_PATH" | cut -d ' ' -f 2)

# Only keep the numbers
NUMBER=${CONTACT//[^[:digit:].-]/}

# Send message
osascript -e "tell application \"Messages\" to send \"$MESSAGE\" to buddy \"$NUMBER\""

# Delete file
# While testing, just append delivered and timestamp to file
printf "\r\nDELIVERED\r\n" >> $FILE_PATH
printf "$(date +'%Y%m%d%H%M%S')" >> $FILE_PATH