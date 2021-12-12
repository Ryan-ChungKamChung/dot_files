#!/bin/bash

# chmod +x load.sh

# After reboot:
# Create SSH Key
# ssh-keygen -t ed25519 -C "ryan.chung-kam-chung@mths.ca"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
# cat ~/.ssh/id_ed25519.pub
# Copy this to GitHub Settings > SSH Keys > Add
# ssh -T git@github.com

# GitHub CLI
# gh auth login

# sudo rm -R ~/dot_files

# Updates and upgrades
sudo apt-get update -y
sudo apt-get dist-upgrade -y

# Download packages
sudo apt install unzip
sudo apt-get -y install python3-pip
sudo pip3 install --upgrade requests
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Load dot files
cp .vimrc ~/.vimrc
cp .bashrc ~/.bashrc
sudo chown ubuntu ~/.bash_profile
cp .bash_profile ~/.bash_profile

# Shell scripts
mkdir ~/scripts
cp ./repo-creation.sh ~/scripts/repo-creation.sh
sudo chmod +x ~/scripts/repo-creation.sh
cp ./java.yml ~/scripts/java.yml
cp ./swift.yml ~/scripts/swift.yml

# Java JDK Installation
sudo apt install default-jdk -y

# Swift Installation
# https://swift.org/download/
sudo apt-get install -y clang libblocksruntime0 libcurl4-openssl-dev -y
wget https://swift.org/builds/swift-5.5-release/ubuntu2004/swift-5.5-RELEASE/swift-5.5-RELEASE-ubuntu20.04.tar.gz
tar -zxvf swift-5.5-RELEASE-ubuntu20.04.tar.gz
sudo mkdir /usr/bin/swift
sudo cp -R ./swift-5.5-RELEASE-ubuntu20.04/usr/* /usr/bin/swift
echo "" >> ~/.bashrc
echo 'export PATH="${PATH}":/usr/bin/swift/bin' >> ~/.bashrc
source ~/.bashrc
sudo rm -R ./swift-5.5-RELEASE-ubuntu20.04
sudo rm ./swift-5.5-RELEASE-ubuntu20.04.tar.gz

# Java Checkstyle Linter
# https://github.com/checkstyle/checkstyle/releases
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.44/checkstyle-8.44-all.jar
cp ./checkstyle-8.44-all.jar ~/scripts/checkstyle.jar
wget https://raw.githubusercontent.com/Mr-Coxall/dot_files/main/mr-coxall_checks.xml
cp ./mr-coxall_checks.xml ~/scripts/

# SwiftLint
# https://github.com/realm/SwiftLint/releases
wget https://github.com/realm/SwiftLint/releases/download/0.44.0/swiftlint_linux.zip
unzip -n swiftlint_linux.zip
sudo mkdir /usr/bin/swiftlint
sudo cp ./swiftlint /usr/bin/swiftlint/
echo 'export PATH="${PATH}":/usr/bin/swiftlint' >> ~/.bashrc

# Swift Syntax Highlighting
mkdir -p ~/.vim/pack/bundle/start
git clone --depth=1 https://github.com/apple/swift/
cp -r ./swift/utils/vim ~/.vim/pack/bundle/start/swift
rm -rf ./swift/

# Java autocompletion
sudo apt install vim-youcompleteme -y
vim-addon-manager install youcompleteme

# load GitHub CLI
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt install gh

# reboot
sudo reboot now
