#!/bin/bash

#  Goal:
#   Have a main plist to watch a folder and check for new files in that folder.
#   If there are files, attempt to schedule the message based on the contents
#   of the file 

#  Usage: 
#   Load Launchclt plist to check a folder for files and 
#   create temp plist for each file to run at specified time.
#   Delete the file when done, but only after successful send
#
#  Content:
#   message.txt
#
#   Contact: Number or Contact Name
#   Date: 06-10-2022 (MM-DD-YYYY)
#   Time: 13:00 (24 hour time)
#   Message: "Words" between quotes for easy tracking
