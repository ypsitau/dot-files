#!/bin/sh
files=".bash_profile .bashrc .emacs.d .gitconfig .vimrc"
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
	ln -s darwin-settings/$f ~/$f
done
