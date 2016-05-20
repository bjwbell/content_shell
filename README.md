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
```
Host git-codecommit.us-east-1.amazonaws.com
User AWS_USER e.g. DQLBE6UBHSLICOQENFZQ
IdentityFile ~/.ssh/id_rsa
```
### git config
```
[remote "origin"]
	url = ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/chrome
	fetch = +refs/heads/*:refs/remotes/origin/*
```

## amazon ec2 container service (docker)

### docker registry url
 `https://118807234198.dkr.ecr.us-east-1.amazonaws.com/ironframe`

### docker instructions
1. Retrieve the docker login command that you can use to authenticate your Docker client to your registry: `aws ecr get-login --region us-east-1`
2. Run the docker login command that was returned in the previous step.
3. Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here. You can skip this step if your image is already built: `docker build -t test1 .`
4. After the build completes, tag your image so you can push the image to this repository: `docker tag test1:latest :latest`
5. Run the following command to push this image to your newly created AWS repository: `docker push :latest`

# jenkins

## centos installation
execute [jenkins-centos.sh](jenkins-centos.sh)

## ubuntu installation
1. `wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -`
2. In `/etc/apt/sources.list` add `deb http://pkg.jenkins-ci.org/debian-stable binary/`
3. Execute `sudo apt-get update && sudo apt-get install jenkins`

## configuration

