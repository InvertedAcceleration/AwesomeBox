#!/bin/bash

echo ""
echo -e "\e[0;34m  ██████╗ ███████╗████████╗    ██████╗ ███████╗ █████╗ ██████╗ ██╗   ██╗    ███████╗ ██████╗ ██████╗                 \033[0m"
echo -e "\e[0;34m ██╔════╝ ██╔════╝╚══██╔══╝    ██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝    ██╔════╝██╔═══██╗██╔══██╗                \033[0m"
echo -e "\e[0;34m ██║  ███╗█████╗     ██║       ██████╔╝█████╗  ███████║██║  ██║ ╚████╔╝     █████╗  ██║   ██║██████╔╝                \033[0m"
echo -e "\e[0;34m ██║   ██║██╔══╝     ██║       ██╔══██╗██╔══╝  ██╔══██║██║  ██║  ╚██╔╝      ██╔══╝  ██║   ██║██╔══██╗                \033[0m"
echo -e "\e[0;34m ╚██████╔╝███████╗   ██║       ██║  ██║███████╗██║  ██║██████╔╝   ██║       ██║     ╚██████╔╝██║  ██║ ██╗██╗██╗      \033[0m"
echo -e "\e[0;34m  ╚═════╝ ╚══════╝   ╚═╝       ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝    ╚═╝       ╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═╝╚═╝╚═╝      \033[0m"
echo -e "\e[0;34m                                                                                                                     \033[0m"
echo -e "\e[0;34m  █████╗ ███╗   ██╗     █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗    ██████╗  ██████╗ ██╗  ██╗██╗\033[0m"
echo -e "\e[0;34m ██╔══██╗████╗  ██║    ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝    ██╔══██╗██╔═══██╗╚██╗██╔╝██║\033[0m"
echo -e "\e[0;34m ███████║██╔██╗ ██║    ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗      ██████╔╝██║   ██║ ╚███╔╝ ██║\033[0m"
echo -e "\e[0;34m ██╔══██║██║╚██╗██║    ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝      ██╔══██╗██║   ██║ ██╔██╗ ╚═╝\033[0m"
echo -e "\e[0;34m ██║  ██║██║ ╚████║    ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗    ██████╔╝╚██████╔╝██╔╝ ██╗██╗\033[0m"
echo -e "\e[0;34m ╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝\033[0m"
echo ""

if [ -f ~/.gituserconfig ]
then
    DEFAULT_GIT_USERNAME="`grep 'name = ' ~/.gituserconfig | awk -F= '{print $2};' | tr -d '[[:space:]]'`"
    DEFAULT_GIT_EMAIL="`grep 'email = ' ~/.gituserconfig | awk -F= '{print $2};' | tr -d '[[:space:]]'`"
fi

echo -n -e "\e[0;32m • Enter your git username [${DEFAULT_GIT_USERNAME}]: "
read GIT_USERNAME

[ -z $GIT_USERNAME ] && [ -z $DEFAULT_GIT_USERNAME ] && GIT_USERNAME=$DEFAULT_GIT_USERNAME

echo -n -e "\e[0;32m • Enter your git email [${DEFAULT_GIT_EMAIL}]: "
read GIT_EMAIL

[ -z $GIT_EMAIL ] && [ -z $DEFAULT_GIT_EMAIL ] && GIT_EMAIL=$DEFAULT_GIT_EMAIL

echo -e "\e[0;34m • Installing core tools.\033[0m"

sudo apt-get update > /dev/null
sudo apt-get -q -y install python-software-properties > /dev/null
sudo add-apt-repository -y ppa:git-core/ppa > /dev/null 2>&1

sudo apt-get update > /dev/null
sudo apt-get -q -y install vim git ncurses-term screen htop bash-completion > /dev/null

echo -e "\e[0;34m • Cleaning up awesomeless settings.\033[0m"

DIRS_TO_REMOVE=('.spf13' '.vim')

for DIR_TO_REMOVE in ${DIRS_TO_REMOVE[@]}
do
    rm -rf ~/$DIR_TO_REMOVE
done

mkdir -p ~/.vim/{backup,temp}

DOT_FILES_TO_SYM_LINK=('.vimrc' '.gitconfig' '.dir_colors' '.bashrc_extras' '.screenrc')

for DOT_FILE in ${DOT_FILES_TO_SYM_LINK[@]}
do
    rm -f ~/$DOT_FILE
    ln -s ~/AwesomeBox/dotFiles/$DOT_FILE ~
done

DOT_FILES_TO_COPY=('.gituserconfig')

for DOT_FILE in ${DOT_FILES_TO_COPY[@]}
do
    cp -n ~/AwesomeBox/dotFiles/$DOT_FILE ~
done

echo -e "\e[0;34m • Installing vundle.\033[0m"
git clone -q https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1

echo -e "\e[0;34m • Installing vim plugins.\033[0m"
vim +PluginInstall +qall

echo -e "\e[0;34m • Updating local config files.\033[0m"

sed -i "s/GIT_USERNAME/$GIT_USERNAME/" ~/.gituserconfig
sed -i "s/GIT_EMAIL/$GIT_EMAIL/" ~/.gituserconfig

cat ~/.bashrc | grep -v "source ~/.bashrc_extras" | tee ~/.bashrc > /dev/null
echo "source ~/.bashrc_extras" | tee -a ~/.bashrc > /dev/null

source ~/.bashrc_extras

echo ""
echo -e "\e[0;32m Done. Enjoy! :)\033[0m"
echo ""
