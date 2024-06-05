files="/etc/bash_completion.d/git-prompt"
files="$files /usr/share/git-core/contrib/completion/git-prompt.sh"
files="$files /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh"
for file in $files
do
	if [ -f $file ]; then
		source $file
		break
	fi
done

PS1="\[\033[01;32m\]\h\[\033[00m\]:\w\[\033[31m\]\$(__git_ps1)\[\033[00m\]$ "
alias ll='ls -alFG'
alias gurax-archive='gurax -S archive.gura'
alias gurax-genmod='gurax -S genmod.gura'
alias gurax-genclass='gurax -S genclass.gura'
alias gurax-grep='gurax -S grep.gura'
alias gurax-gendoc-class='gurax -S gendoc-class.gura'
alias gurax-gendoc-module='gurax -S gendoc-module.gura'
alias gura-archive='gura -S archive.gura'
alias gura-genmod='gura -S genmod.gura'
alias gura-genclass='gura -S genclass.gura'
alias gura-grep='gura -S grep.gura'
alias gura-gendoc-class='gura -S gendoc-class.gura'
alias gura-gendoc-module='gura -S gendoc-module.gura'
alias mtp-info='gura -S mtp-info.gura'
alias mtp-ls='gura -S mtp-ls.gura'
alias mtp-recv='gura -S mtp-recv.gura'
alias mtp-rm='gura -S mtp-rm.gura'
alias mtp-send='gura -S mtp-send.gura'
alias dump='od -Ax -tx1'
export GURAPATH=gnuc:../gnuc
export GURAXPATH=gnuc:../gnuc
export JRASMPATH=$HOME/jrasm/inc
export PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin:~/bin:~/tools/clang/bin:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools

# "git diff" can't handle escape sequences with the following settings.
#export LESS=--tabs=4
#if [ "${OSTYPE:0:6}"="darwin" ]; then
#	export MORE=--tabs=4
#fi

#tabs -4
