if [ -f /etc/bash_completion.d/git ]; then
	source /etc/bash_completion.d/git
elif [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
	source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

PS1="\w\$ "
alias ll='ls -alF'
export GURAPATH=gnuc
