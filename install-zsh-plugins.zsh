#! /bin/bash
if ! [[ `readlink /proc/$$/exe` = */zsh ]] ; then
    echo use zsh to run this script
    exit
fi

echo check \$ZSH_CUSTOM exist
if [ -z "$ZSH_CUSTOM" ] ; then
    echo \$ZSH_CUSTOM not exist use \${HOME}/.oh-my-zsh/custom instead
    ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
else
    echo \$ZSH_CUSTOM exist as ${ZSH_CUSTOM}
fi


ZSH_CONFIG="${HOME}/.zshrc"
TEMP_ZSH_CONFIG="${HOME}/.zshrc.temp"
cp $ZSH_CONFIG $TEMP_ZSH_CONFIG
echo check zsh-autosuggestions installation
if [[ -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]] ; then
    echo zsh-autosuggestions dir already exist
else
    echo start install zsh-autosuggestions from https://github.com/zsh-users/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

echo check zsh-autosuggestions registered
if [[ "`grep ^plugins= $TEMP_ZSH_CONFIG`" =~ zsh-autosuggestions ]] ; then
    echo zsh-autosuggestions already registered
else
    echo register zsh-autosuggestions to $ZSH_CONFIG
    sed -e 's/^plugins=(/&zsh-autosuggestions /' $TEMP_ZSH_CONFIG > $ZSH_CONFIG
    cp $ZSH_CONFIG $TEMP_ZSH_CONFIG
fi

echo start install zsh-completions from https://github.com/zsh-users/zsh-completions
if [[ -d "${ZSH_CUSTOM}/plugins/zsh-completions" ]] ; then
    echo zsh-completions dir already exist
else
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM}/plugins/zsh-completions
fi

echo check zsh-completions registered
if [[ "`grep ^plugins= $TEMP_ZSH_CONFIG`" =~ zsh-completions ]] ; then
    echo zsh-completions already registered
else
    echo register zsh-completions to $ZSH_CONFIG
    sed -e 's/^plugins=(/&zsh-completions /' $TEMP_ZSH_CONFIG  > $ZSH_CONFIG
    cp $ZSH_CONFIG $TEMP_ZSH_CONFIG
fi

echo start install zsh-syntax-highlighting from https://github.com/zsh-users/zsh-syntax-highlighting
if [[ -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]] ; then
    echo zsh-syntax-highlighting dir already exist
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

echo check zsh-syntax-highlighting registered
if [[ "`grep ^plugins= $TEMP_ZSH_CONFIG`" =~ zsh-syntax-highlighting ]] ; then
    echo zsh-syntax-highlighting already registered
else
    echo register zsh-syntax-highlighting to $ZSH_CONFIG
    sed -e 's/^plugins=(/&zsh-syntax-highlighting /' $TEMP_ZSH_CONFIG  > $ZSH_CONFIG
    cp $ZSH_CONFIG $TEMP_ZSH_CONFIG
fi


echo start install Powerlevel10k from https://github.com/romkatv/powerlevel10k.git
if [[ -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]] ; then
    echo powerlevel10k dir already exist
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
    sed -e 's/^ZSH_THEME=\"\S*\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/' $TEMP_ZSH_CONFIG > $ZSH_CONFIG
    cp $ZSH_CONFIG $TEMP_ZSH_CONFIG
fi
