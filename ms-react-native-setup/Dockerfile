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

RUN git clone https://github.com/mganandraj/.files.git /usr/.files && export DOTFILES=/usr/.files

RUN cd $HOME
RUN ln -fs $DOTFILES/.vimrc
RUN chmod +x $DOTFILES/gitconfig.sh && $DOTFILES/gitconfig.sh

RUN chmod +x $DOTFILES/ubuntu/java.sh && $DOTFILES/ubuntu/java.sh
RUN chmod +x $DOTFILES/ubuntu/node.sh && $DOTFILES/ubuntu/node.sh
RUN chmod +x $DOTFILES/ubuntu/mono.18.04.sh && $DOTFILES/ubuntu/mono.18.04.sh
RUN chmod +x $DOTFILES/ubuntu/pwsh.sh && $DOTFILES/ubuntu/pwsh.sh
RUN chmod +x $DOTFILES/ubuntu/nuget.sh && $DOTFILES/ubuntu/nuget.sh
RUN chmod +x $DOTFILES/ubuntu/android-dev.sh && $DOTFILES/ubuntu/android-dev.sh



