# content_shell
Execute `cp-content-shell.sh` to copy content_shell from chromium build.


## IronFrame Layout Tests
The IronFrame layout tests are under `third_party/WebKit/LayoutTests/http/tests/ironframe`.

To run them, execute:
```
python testing/xvfb.py out/Default/ python third_party/WebKit/Tools/Scripts/run-webkit-tests -t Default http/tests/ironframe
```

# amazon aws
## amazon aws codecommit

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

For the pipeline file, use [Ironframe-FullBuild-Pipeline](Ironframe-FullBuild-Pipeline).

*Ironframe merge master*

For the pipeline file, use [Ironframe-Merge-Upstream-Pipeline](Ironframe-Merge-Upstream-Pipeline).

## Add depot_tools to jenkins PATH

1. Add EnjInject plugin to jenkins
2. Clone depot_tools to /var/lib/jenkins - `git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git`.
3. Modify PATH for jenkins job - `PATH=/var/lib/jenkins/depot_tools:$PATH`.
   Section `Prepare an environment for the run` and subsection - `Properties Content`.

# buildbot
Execute `buildbot/buildbot-master-slave.sh` to setup up a buildbot master and slave in the current directory.

# Xvfb
Setup for running chrome via Xvfb
## Server side
```
export DISPLAY=:1
Xvfb :1 -screen 0 1024x768x16 &
fluxbox &
x11vnc -display :1 -bg -nopw -listen localhost -xkb
```

## Client side e.g. laptop
```
ssh -N -T -L 5900:localhost:5900 user@remotehost &
vncviewer -encodings 'copyrect tight zrle hextile' localhost:5900
```

