# schedule_sms

### Description

This script will run as part of a LaunchCtl Agent. The agent will watch a folder, `messages`, for new files.

Each new file will be parsed, and a new plist will be created/loaded for each new message. Plist will be unloaded and deleted after successful send

#### File Contents
```
  Contact: 1234567890 (any phone number)
  Date: 06-08-2022 (MM-DD-YYYY)
  Time: 13:00 (24 hour time)
  Message: "Message content between quotes"
```