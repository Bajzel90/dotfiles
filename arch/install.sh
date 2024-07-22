#!/bin/bash

install_yay_manager() {
  cd ~ || return
  pacman -Sy --needed git base-devel

  git clone https://aur.archlinux.org/yay.git
  cd ~/yay || return
  makepkg -si

  cd ~ || return
}

download_dotfiles() {
  git clone https://github.com/Bajzel90/dotfiles.git
}

install_bluetooth() {
  sudo pacman -S bluez bluez-utils
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
  ln -s ~/dotfiles/arch/zshrc ~/.zshrc
}

install_tmux() {
  pacman -S tmux
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
}

install_neovim() {
  sudo pacman -S neovim fd xclip nodejs npm ttf-hack-nerd fzf go python jq lazygit
  npm install --global poor-mans-t-sql-formatter-cli

  FILE=~/.config/nvim

  if [[ ! -f "$FILE" ]]; then
    ln -s ~/dotfiles/config/nvim $FILE
  else
    rm $FILE
    ln -s ~/dotfiles/config/nvim $FILE
  fi
}

install_addtional_packages() {
  sudo pacman -S keepassxc spotify-launcher remmina github-cli timeshift transmission-gtk

  yay -S forticlient-vpn
}
set_capslock_to_esc
# download_dotfiles
# install_yay_manager
# install_bluetooth
# install_zsh
# install_tmux
# install_neovim
# install_addtional_packages
