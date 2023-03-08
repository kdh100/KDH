1. .bashrc

export PS1='\e[0;31m[\u @ \e[0;33m\h \w]\$ \e[m'
alias c='clear'
alias vi='/usr/bin/vim'

2. .vimrc

syntax on
set nu ai ts=2 sw=2

3. dd

dd if=text.txt conv=u(upper)|l(lower)case of=modified.txt
dd if=/dev/zero bs=1M count=1000 of=testblockfile

4. repository

yum install -y epel epel-release remi-release
    * If, repolist count doesnt match unexpectedly,
        -> "vi /etc/yum.repos.d/remi.repo > enabled=1" check

5. useful package

jq : display .json files in json format
    * sudo yum install -y epel-release
    * sudo yum install -y jq
        - cat <file.json> | jq