#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI.
# Choose the options by commenting/uncommenting with '#'-sign.

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# Build-essential.
sudo apt install -y build-essential 

# Microcode for Intel/AMD 
sudo apt install -y amd64-microcode
#sudo apt install -y intel-microcode 

#XFCE packages
sudo apt install -y xfce4 xfce4-goodies

# Browser Installation (eg. chromium)
sudo apt install -y firefox-esr 

# Network File Tools/System Events
sudo apt install -y dialog mtools acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Networking etc
sudo apt install -y policykit-1-gnome network-manager network-manager-gnome

# Sound packages (pulseaudio installed prior)
sudo apt install -y pulseaudio alsa-utils volumeicon-alsa

# Neofetch/HTOP
sudo apt install -y neofetch htop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa

# Printing, scanner and bluetooth (if needed)
sudo apt install -y cups simple-scan system-config-printer
sudo apt install -y bluez blueman bluez-firmware

sudo systemctl enable bluetooth
sudo systemctl enable cups

# Command line text editor -- nano preinstalled  -- I like micro but vim is great
# sudo apt install -y micro
#sudo apt install -y vim

# Install fonts
sudo apt install fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus fonts-noto-color-emoji

# PDF 
sudo apt install -y  evince pdfarranger

# Install LightDM GTK Greeter Settings (lightdm,lightdm-gtk-greeter installs with xfce)

sudo apt install -y lightdm-gtk-greeter-settings mugshot slick-greeter
sudo systemctl enable lightdm

#Flatpak support
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo apt autoremove

printf "\e[1;32mTime to reboot! Thanks!\e[0m\n"
