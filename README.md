# content_shell
Execute `cp-content-shell.sh` to copy content_shell from chromium build.

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

1. Execute `sudo service jenkins start`
2. Goto `http://ipaddr:8080` to begin jenkins install.


Add codecommit keys to jenkins user:

1. Execute `sudo su -s /bin/bash jenkins` to login as jenkins user.
2. Execute `ssh git-codecommit.us-east-1.amazonaws.com` to add host to `~/.ssh/known_hosts`.


## Jenkins Pipeline
*Ironframe*
```
node {
   stage 'Checkout'
   checkout([$class: 'GitSCM', branches: [[name: '*/ironframe']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CloneOption', noTags: true, reference: '', shallow: true, timeout: 180]], submoduleCfg: [], userRemoteConfigs: [[url: 'ssh://APKAJHXR727PTXMIECSQ@git-codecommit.us-east-1.amazonaws.com/v1/repos/chrome']]])
   stage 'Build'
   sh "gn gen out/Default"
   sh "ninja -C out/Default content_shell"
}
```

*Chromium*
```
node {
   stage 'Checkout'
   sh "fetch --nohooks --no-history chromium"
   stage 'Build'
   sh "gn gen out/Default"
   sh "ninja -C out/Default content_shell"
}
```


## Add depot_tools to jenkins PATH

1. Add EnjInject plugin to jenkins
2. Clone depot_tools to /var/lib/jenkins - `git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git`.
3. Modify PATH for jenkins job - `PATH=/var/lib/jenkins/depot_tools:$PATH`.
   Section `Prepare an environment for the run` and subsection - `Properties Content`.
