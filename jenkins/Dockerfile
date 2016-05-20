FROM jenkins
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y make
RUN apt-get install python-pip
RUN pip install awscli
USER jenkins # drop back to the regular jenkins user - good practice