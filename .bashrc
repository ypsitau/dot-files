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

PS1="\w\[\033[31m\]\$(__git_ps1)\[\033[00m\]$ "
alias ll='ls -alFG'
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
export GURAPATH=gnuc:../gnuc
export PATH=/usr/local/bin:$PATH:/usr/local/texlive/2014/bin/x86_64-darwin:~/bin:~/tools/clang/bin:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools

# "git diff" can't handle escape sequences with the following settings.
#export LESS=--tabs=4
#if [ "${OSTYPE:0:6}"="darwin" ]; then
#	export MORE=--tabs=4
#fi

tabs -4
