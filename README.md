# content_shell
Copy content_shell from chromium build

# syncing with upstream
The `crontab` file contains a cron job for daily merging from upstream into the ironframe branch.

# jenkins

## ubuntu installation
1. `wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -`
2. In `/etc/apt/sources.list` add `deb http://pkg.jenkins-ci.org/debian-stable binary/`
3. Execute `sudo apt-get update && sudo apt-get install jenkins`

## configuration

