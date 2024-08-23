#!/bin/bash

install_yay_manager() {
    cd ~ || return
    pacman -Sy --needed git base-devel

    git clone https://aur.archlinux.org/yay.git
    cd ~/yay || return
    makepkg -si

    cd ~ || return
}

create_backup() {
    _file="$1"
    if [ -f "$_file" ]; then
        mv "$_file" "$_file".bak
    fi
}

download_dotfiles() {
    cd ~ || exit
    git clone https://github.com/Bajzel90/dotfiles.git

    create_backup ~/.zshrc
    create_backup ~/.tmux.conf

    ln -s ~/dotfiles/arch/zshrc ~/.zshrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
}

install_bluetooth() {
    sudo pacman -S bluez bluez-utils
    systemctl enable bluetooth.service
    systemctl start bluetooth.service
}

set_capslock_to_esc() {
    setxkbmap -option caps:escape
}

install_zsh() {
    pacman -Sy zsh zsh-completions
    autoload -Uz zsh-newuser-install
    zsh-newuser-install -f
    chsh -s /usr/bin/zsh

    sudo pacman -S zoxide

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_tmux() {
    pacman -S tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ~/.tmux/plugins/tpm/bin/install_plugins
}

install_neovim() {
    sudo pacman -S neovim fd xclip nodejs npm ttf-hack-nerd fzf go python jq lazygit pandoc imagemagic luarocks ripgrep
    npm install --global poor-mans-t-sql-formatter-cli

    _file=~/.config/nvim

    create_backup $_file
    ln -s ~/dotfiles/config/nvim "$_file"
}

install_addtional_packages() {
    sudo pacman -s keepassxc spotify-launcher remmina github-cli timeshift transmission-gtk cups flameshot brightnessctl

    yay -s forticlient-vpn polybar feh rofi picom i3lock-color betterlockscreen
}

install_i3() {
    sudo pacman -s flameshot brightnessctl

    yay -s i3 polybar feh rofi picom i3lock-color betterlockscreen
}

set_capslock_to_esc
download_dotfiles
install_yay_manager
install_bluetooth
install_zsh
install_tmux
install_neovim
install_addtional_packages
