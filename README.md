# content_shell
Copy content_shell from chromium build

# upstream syncing
The [crontab](crontab) file contains a cron job for daily merging from upstream into the ironframe branch.

# amazon aws

## aws cli
To install on ubuntu execute:
```
sudo apt-get install python-pip
sudo -H pip install awscli
```

## amazon aws codedeploy

### ssh config
File `~/.ssh/config`:
```
Host git-codecommit.us-east-1.amazonaws.com
User CODECOMMIT_RSA_KEY_ID e.g. DQLBE6UBHSLICOQENFZQ
IdentityFile ~/.ssh/id_rsa
```
### git config
```
[remote "origin"]
	url = ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/chrome
	fetch = +refs/heads/*:refs/remotes/origin/*
```

# jenkins

## centos installation
execute [jenkins-centos.sh](jenkins-centos.sh)

## ubuntu installation
1. `wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -`
2. In `/etc/apt/sources.list` add `deb http://pkg.jenkins-ci.org/debian-stable binary/`
3. Execute `sudo apt-get update && sudo apt-get install jenkins`

## configuration

