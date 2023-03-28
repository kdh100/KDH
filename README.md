1. .bashrc

# Export variables
export PS1='\e[0;31m[\u @ \e[0;33m\h \w]\$ \e[m'
export PATH=$PATH:/home/<username>
export DATE=`date`

# Alias
alias c='clear'
alias ll='ls -al --time-style="+%Y.%m.%d %H:%M:%S"'
alias vi='/usr/bin/vim'
alias date='date "+%Y.%m.%d %H:%M:%S"'

2. .vimrc

syntax on
set nu ai ts=2 sw=2

3. /etc/sudoers

permission to users to CMD without verifying password

sudo vi /etc/sudoers
(username) ALL=NOPASSWD: ALL
    * append this config at the bottom of file context

4. repository

sudo yum install -y epel-release
sudo apt update && sudo apt upgrade

5. useful package

jq : display .json files in json format
    * sudo yum install -y jq
        - cat <file.json> | jq

bpytop : resource monitoring tool
    * sudo pip3 install -y psutil bpytop

6. useful command

dd : 

dd if=/dev/zero bs=1M count=1000 of=testblockfile
dd if=text.txt conv=u(upper)|l(lower)case of=modifiedtext.txt