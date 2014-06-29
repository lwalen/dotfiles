#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable colors file
if [ -f /etc/bash/colors ]; then
	. /etc/bash/colors
fi

# set prompt
if [ `whoami` == "root" ]; then
	color="${bred}"
else
	color="${blue}"
fi
PS1="${color}[\u@\h \W]\$${color_off} "

# set prompt command
#case $TERM in
#	xterm*)
#		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD##*/}\007"'
#		;;
#	*)
#		;;
#esac

# automatically resize
shopt -s checkwinsize

# enable aliases file
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# enable other completions
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

export LC_ALL=C

# ignore 'exit' in bash history
export HISTIGNORE="&:exit"

# use vim for editor
export EDITOR=vim

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# start in home directory
cd

