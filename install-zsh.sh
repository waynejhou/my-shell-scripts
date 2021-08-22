#! /bin/bash

echo start install zsh from apt-get
if which zsh > /dev/null ; then
    echo zsh already installed
else
    sudo apt-get install zsh
fi
