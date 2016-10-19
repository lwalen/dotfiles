#!/bin/bash

# bash convenience and coloring
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

fi

alias ls='ls -pG'
alias ll='ls -alpFG'
alias la='ls -ApG'
#alias ll='ls -lvh'
#alias la='ls -Av'
#alias lla='ls -lvha'

alias diff='diff -W $(tput cols)'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias c='clear'
alias less='less -R' # show colors
alias sqlite="sqlite3 -header -column" # nicer formatting
alias lzip="unzip -l" # show contents of .zip
alias rmeof="perl -pi -e 'chomp if eof'"

alias serve="python -m SimpleHTTPServer 4000"

# scripts
alias dump="/home/lars/other/scripts/dump.sh"
alias episode-namer="/home/lars/other/scripts/name_episodes.rb"
alias list-episodes="/home/lars/other/scripts/list_episodes.rb"
alias flac2mp3="/home/lars/other/scripts/flac_to_mp3.sh"

function gorun() {
	go install -v ./... && ~/go/bin/${PWD##*/} $@
}

function gocover() {
	gotestcover -coverprofile cover.out ./... && go tool cover -html=cover.out
	rm cover.out 2> /dev/null
}

function ez_grep() {
	grep -rsI "$1" ~/code/ez_grep | sed -e 's|/Users/lars/code/||g' 2> /dev/null
}

function b64() {
	echo "$1" | base64 -D
}

function b64_url() {
	echo "$1" | base64 -D | sed 's/&amp;/\&/g'
}

#
function mig() {
	if [ -f db/migrate/ ]; then
		$EDITOR db/migrate/`ls -t db/migrate/ | head -1`
	else
		"You must be at the root of a rails app."
	fi
}

function pps() { ps aux | grep "$@" | grep -v 'grep'; }

# recursively replace in directory
rr () {
	dest=${3:-.}

	echo "replacing \"$1\" with \"$2\" in $dest"
	gfind "$dest" ! -path '*/\.*' -type f -print0 | xargs -0 gsed -i "s|$1|$2|g"
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

uuidme () {
	uuidgen | tr '[:upper:]' '[:lower:]'
}

inv () {
	invoker reload $(basename $(pwd))
}
