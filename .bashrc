# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# history
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='st:aa:co:ps:pl:di:me:v:history:gh:l:la:ll:htop:py'
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# __define_git_completion and __git_shortcut taken from
# https://github.com/bronson/dotfiles/blob/master/.bashrc
__define_git_completion () {
eval "
    _git_$2_shortcut () {
        COMP_LINE=\"git $2\${COMP_LINE#$1}\"
        let COMP_POINT+=$((4+${#2}-${#1}))
        COMP_WORDS=(git $2 \"\${COMP_WORDS[@]:1}\")
        let COMP_CWORD+=1
        local cur words cword prev
        _get_comp_words_by_ref -n =: cur words cword prev
        _git_$2
    }
"
}
__git_shortcut () {
    type _git_$2_shortcut &>/dev/null || __define_git_completion $1 $2
    local args=${@: 3}
    alias $1="git $2 $args"
    complete -o default -o nospace -F _git_$2_shortcut $1
}

# git aliases with tab completion
__git_shortcut ad add
__git_shortcut br branch
__git_shortcut ch checkout

# git aliases without tab completion
alias st='git status -s'
alias aa='git add .'
alias co='git commit'
alias cl='git clone'
alias di='git diff'
alias ps='git push origin master'
alias pl='git pull'
alias lo="git log --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset%s %Cgreen%cr %C(bold blue)%an%Creset' --abbrev-commit"

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
alias p='cd \-'

# ls aiases
alias l='ls --ignore="*.pyc"'
alias ll='ls -lh --ignore="*.pyc"'
alias la='ls -lah'

# make aliases
alias ma='make all'
alias mt='make test'
alias mf='make test_full'
alias m8='make flake8'

# misc aliases
alias py='ipython'
alias me='meld .'
alias sb='source ~/.bashrc'
alias v='cd /devel; vim'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Fancy prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[0;34m\]\u@\h\[\033[33m\]:\[\033[40m\]\w`__git_ps1`\$\[\033[00m\] '
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

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

# git status all (sta) -------------------------------------------------------
#
# modified from https://coderwall.com/p/ewz5zq

function sta () {
    for gitdir in `find . -name .git`;
    do
        worktree=${gitdir%/*};
        if (! unstaged_changes $gitdir) || (! uncommited_changes $gitdir) \
           || (untracked $gitdir = 0)
        then
            echo "=== $gitdir ==="
            git --git-dir=$gitdir --work-tree="$worktree" status -s
        fi
    done
}

function unstaged_changes() {
    worktree=${1%/*};
    git --git-dir="$1" --work-tree="$worktree" diff-files --quiet \
        --ignore-submodules --
}

function uncommited_changes() {
    worktree=${1%/*};
    git --git-dir="$1" --work-tree="$worktree" diff-index --cached --quiet \
        HEAD --ignore-submodules --
}

function untracked() {
    worktree=${1%/*};
    git --git-dir="$1" --work-tree="$worktree" ls-files --other \
        --exclude-standard --error-unmatch . >/dev/null 2>&1
}
