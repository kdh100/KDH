1. bashrc configuration for prompt

export PS1='\e[0;31m[\u @ \e[0;33m\h \w]\$ \e[m'
alias c='clear'
alias vi='/usr/bin/vim'

2. dd

dd if=text.txt conv=u(upper)|l(lower)case of=modified.txt
dd if=/dev/zero bs=1M count=1000 of=testblockfile