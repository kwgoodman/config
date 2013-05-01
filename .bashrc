# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then

    # colors
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

fi

# git aliases
alias st='git status'
alias ad='git add'
alias aa='git add .'
alias co='git commit'
alias ch='git checkout'
alias lo='git log'
alias cl='git clone'
alias di='git diff'
alias ps='git push origin master'
alias pl='git pull'
alias br='git branch'

# place aliases
alias de='cd /devel'
alias da='cd /data'
alias dp='cd /usr/local/lib/python2.7/dist-packages'
alias gh='cd ~/ghar/config'

# cd
alias c='cd'
alias c.='cd ..'
alias c..='cd ../..'
alias c...='cd ../../..'

# ls aiases
alias l='ls'
alias ll='ls -l'
alias la='ls -la'

# misc aliases
alias py='ipython'
alias ma='make all'
alias mt='make test'
alias me='meld .'
alias sb='source ~/.bashrc'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Fancy prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[0;34m\]\u@\h\[\033[33m\]:\[\033[1;30m\]\w\$\[\033[00m\] '

export PATH=$PATH:~/ghar/bin/

# When vim is used in terminal (instead of gui) the terminal should pass
# through CNTRL-S to vim (for use as 'save') instead of stop scrolling
vim()
{
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}
