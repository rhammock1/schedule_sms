# schedule_sms

### Description

This script will run as part of a LaunchCtl Agent. When the agent runs at night,
it will check for new files in the path to the messages folder.

Each new file will be parsed, and a new plist will be created/loaded for each new message.

#### File Contents
```
  Contact: 1234567890 (any phone number)
  Date: 06-08-2022 (MM-DD-YYYY)
  Time: 13:00 (24 hour time)
  Message: "Message content between quotes"
```