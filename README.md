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

3. dd

dd if=/dev/zero bs=1M count=1000 of=testblockfile
dd if=text.txt conv=u(upper)|l(lower)case of=modifiedtext.txt

4. repository

yum install -y epel-release

5. useful package

jq : display .json files in json format
    * sudo yum install -y jq
        - cat <file.json> | jq