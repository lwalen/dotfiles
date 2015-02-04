#!/bin/bash

# bash convenience and coloring
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

fi

alias ls='ls -pvG --color'
alias ll='ls -alvpFG --color'
alias la='ls -AvpG --color'
#alias ll='ls -lvh'
#alias la='ls -Av'
#alias lla='ls -lvha'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias c='clear'
alias less='less -R' # show colors
alias sqlite="sqlite3 -header -column" # nicer formatting
alias lzip="unzip -l" # show contents of .zip

# scripts
alias dump="/home/lars/other/scripts/dump.sh"
alias episode-namer="/home/lars/other/scripts/name_episodes.rb"
alias flac2mp3="/home/lars/other/scripts/flac_to_mp3.sh"

# 
function mig() { 
	if [ -f db/migrate/ ]; then
		$EDITOR db/migrate/`ls -t db/migrate/ | head -1`
	else
		"You must be at the root of a rails app."
	fi
}

function pps() { ps aux | grep "$@" | grep -v 'grep'; }

# recursively replace in files from current directory
rr () {
	echo "replacing \"$1\" with \"$2\""
	find . ! -path '*/\.*' -type f -print0 | xargs -0 sed -i "s|$1|$2|g"
}

# show permissions in octal
perm () {
	if [ "$#" -eq 0 ]
	then
		stat -c "%a %n" `pwd`/*
	elif [ "$#" -eq 1 ]
	then
		stat -c "%a" "$@"
	else
		stat -c "%a %n" "$@"
	fi
}

# start SketchUp
sketchup () {
	export WINEPREFIX="${HOME}/.sketchup"
	wine .sketchup/drive_c/Program\ Files/SketchUp/SketchUp\ 2015/SketchUp.exe
}
