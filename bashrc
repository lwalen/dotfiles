#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable colors file
[ -f ~/.bash_colors ] && . ~/.bash_colors

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

#export LC_ALL=C

# ignore 'exit' in bash history
export HISTIGNORE="&:exit"

# use vim for editor
export EDITOR=vim

# path
export PATH="$HOME/.rbenv/bin:$HOME/.bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# I hate typing 'bundle exec'
[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh

# if START_DIR environment variable is set, start there
# else start in home directory
if [ -n "$START_DIR" ]; then
	cd "$START_DIR"
else
	cd
fi

