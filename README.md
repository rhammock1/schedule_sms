# schedule_sms

## Description
For use with MacOS

This script will run as part of a LaunchCtl Agent. The agent will watch a folder, `messages`, for new files.

Each new file will be parsed, and scheduled to be sent via the `at` command.
Once scheduled, a `SCHEDULED` flag and timestamp will be appended to the file
Once delivered, a `DELIVERED` flag and timestamp will be added

## Getting Started
Create `2` folders in the root of this project, `messages`, and `logs`
(I also use a third folder, `drafts` to hold messages temporarily until I'm ready to schedule them)

Messages should be created as `*.txt` files. Filenames do not matter.

`com.example.schedule_sms.plist` can be edited and copied over to `~/Library/LaunchAgents/`
## Message Format
```
  Contact: 1234567890 (any phone number)
  Date: 2022-06-08 (YYYY-MM-DD)
  Time: 13:00 (24 hour time)
  Message: "Message content between quotes"
```
