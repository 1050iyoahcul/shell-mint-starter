#!/bin/bash

declare -a tools=(vim git)

init()
{
  echo -n "Do you wish to update [Y/n]: "
  read -r answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]] ;then
    echo -n "Updating : "
    # apt update
    echo "Success"
    return 1
  fi
}

install_tools()
{
  echo -n "Do you wish to install $1 [Y/n]: "
  read -r answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]] ;then
    echo -n "Installing $1: "
    apt install $1 -y
    echo "Success"
    if [[ "$1" == "git" ]] ;then
      git config --global user.email "iyoahcul@gmail.com"
      git config --global user.name "luchaoyi"
    fi
    return 1
  fi
}

install_ssh()
{
  echo -n "Do you wish to install ssh-keygen [Y/n]: "
  read -r answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]] ;then
    echo -n "Installing ssh-keygen: "
    # ssh-keygen
    echo "Success"
    return 1
  fi
}

install_shadowsocks()
{
  echo -n "Do you wish to install shadowsocks [Y/n]: "
  read -r answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]] ;then
    echo -n "Installing shadowsocks: "
    # sudo add-apt-repository ppa:hzwhuang/ss-qt5
    # apt update
    # apt install shadowsocks-qt5
    echo "Success"
    return 1
  fi
}

install_zsh()
{
  echo -n "Do you wish to install zsh [Y/n]: "
  read -r answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]] ;then
    echo -n "Installing zsh: "
    sudo apt install zsh -y
    zsh --version
    chsh -s $(which zsh)
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo "Success"
    return 1
  fi
}

install_node()
{
  echo -n "Do you wish to install node [Y/n]: "
  read -r answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]] ;then
    echo -n "Installing node: "
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
    #todo source bash
    nvm install node
    echo "Success"
    return 1
  fi

}

init 
for tool in "${tools[@]}"
do
install_tools $tool 
done



install_ssh
install_shadowsocks
install_zsh 
install_node || exit 1









