#! /bin/bash

if ! which zsh > /dev/null ; then
    echo zsh not found
    exit
fi

echo start install git from apt-get
if which git > /dev/null ; then
    echo git already installed
else
    sudo apt-get install git
fi

echo start install wget from apt-get
if which wget > /dev/null ; then
    echo wget already installed
else
    sudo apt-get install wget
fi

echo start install oh-my-zsh from https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
if [ -d "${HOME}/.oh-my-zsh" ] ; then
    echo oh-my-zsh dir already exist
else
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi
