#!/bin/sh
files=".bashrc .emacs.d .gitconfig .vimrc"
if [ "${OSTYPE:0:6}" = "darwin" ]; then
	files="${files} .bash_profile"
fi
for f in $files; do
	if [ -L ~/$f ]; then
		rm ~/$f
		echo link $f was replaced.
	elif [ -f ~/$f ]; then
		rm ~/$f
		echo file $f was replaced.
	elif [ -d ~/$f ]; then
		rm -rf ~/$f
		echo dir  $f was replaced.
	else
		echo link $f was newly created.
	fi
	ln -s dotfiles-darwin/$f ~/$f
done
