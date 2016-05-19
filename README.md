# content_shell
Copy content_shell from chromium build

# syncing with upstream
The [crontab](crontab) file contains a cron job for daily merging from upstream into the ironframe branch.

# amazon aws codedeploy

## ssh config
```
Host git-codecommit.us-east-1.amazonaws.com
User AWS_USER e.g. DQLBE6UBHSLICOQENFZQ
IdentityFile ~/.ssh/id_rsa
```
## git config
```
[remote "origin"]
	url = ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/chrome
	fetch = +refs/heads/*:refs/remotes/origin/*
```
# jenkins

## ubuntu installation
1. `wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -`
2. In `/etc/apt/sources.list` add `deb http://pkg.jenkins-ci.org/debian-stable binary/`
3. Execute `sudo apt-get update && sudo apt-get install jenkins`

## configuration

