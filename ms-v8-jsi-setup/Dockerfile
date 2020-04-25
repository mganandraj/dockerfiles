FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends wget

# https://docs.microsoft.com/en-us/windows-server/administration/linux-package-repository-for-microsoft-software
# Install Microsoft stuff
RUN apt-get install -y ca-certificates
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb --no-check-certificate
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Install Microsoft GPG public key
RUN curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN apt-get update

# https://launchpad.net/~git-core/+archive/ubuntu/candidate
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update
RUN apt-get install git -y
