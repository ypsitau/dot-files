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
export GURAPATH=gnuc
export PATH=$PATH:/usr/texbin:~/bin:~/tools/clang/bin

# "git diff" can't handle escape sequences with the following settings.
#export LESS=--tabs=4
#if [ "${OSTYPE:0:6}"="darwin" ]; then
#	export MORE=--tabs=4
#fi

tabs -4
