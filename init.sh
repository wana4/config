#!/bin/sh
MAKE_LINK_LIST=".vimrc .vim .bashrc .gitconfig"
cd $(dirname $0)
for dotfile in $MAKE_LINK_LIST
do
	ln -Fis "$PWD/$dotfile" $HOME
done

# git がインストールされたら、git complehentionを持ってくる
cp /etc/bash_completion.d/git $HOME/.git-completion.sh
