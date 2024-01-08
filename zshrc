#aliases below

alias shuf="sort -R"
alias py="python3"
alias sl="ls"
alias clip=pbcopy
alias desktop="cd /Users/tugberk/Desktop"
#alias rm='rm -i'
alias refresh='source ~/.zshrc'
alias untar="tar -zxvf $1"
alias tar="tar -czvf $1"
alias ls="ls --color"
alias home="cd ~"
alias myip="curl ipinfo.io/ip"
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias pserver='python3 -m http.server'
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -alF'
alias zshrc='vim ~/.zshrc'
alias gs='git status'
alias logd='git log --all --graph --decorate'
alias logone='git log --all --graph --decorate --oneline'
alias ..='cd ..'
#DISABLE_LS_COLORS=true


#new python project
function newproject() {
	mkdir $1
	cd $1
	ve
	va
}


function mcd() {
	mkdir -p $1
	cd "$1"
}


#marp with beamer css
function marpbeamer() {
	marp --allow-local-files --theme ~/beamer.css $1 -o $2
}

	

#frequency analysis of a text
function analyze() {
sed -e 's/[^[:alpha:]]/ /g' $1 | tr '\n' " " |  tr -s " " | tr " " '\n'| tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | nl > analyze_output.txt

}

function beamer() {

	FOO=$(uuidgen | tr -d "-")
	pandoc -t beamer -s $1.md -o $FOO.pdf && open $FOO.pdf
}

function tohtml() {

	if [ "$#" -lt 2 ] || [ "$#" -gt 2 ]
	then
		echo "you have either gave less or more args than necessary"
		echo "usage: tohtml file.md out"
		return 0
	fi
	generate-md --layout witex --input $1 --output $2
}


PROMPT="%F{green}[tugberk%f @ air]$ "
RPROMPT="[%1d] @ [%T]"

