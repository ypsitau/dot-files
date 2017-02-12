#!/bin/sh
files=".bashrc .emacs.d .gitconfig .vimrc .bash_profile .octaverc"
script_absdir=`dirname "$PWD/${0#./}"`
script_reldir=${script_absdir#${HOME}/}
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
	ln -s $script_reldir/$f ~/$f
done
