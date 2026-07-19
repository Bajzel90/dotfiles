#!/bin/bash
DEPS=(
  waybar
  snixembed # notyfikacje u używające starego XEmbed
  wireplumber
  wl-clipboard
  ghostty
  nautilus
  zen-browser
  walker elephant elephant-providerlist elephant-desktopapplications elephant-files elephant-runner elephant-clipboard
  brightnessctl
  playerctl
  hyprpaper
  hyprshutdown
  mako
  btop
  htop
  jolt
  lazygit
  yazi
  fzf
  freetube-bin
  vulkan-intel
  vulkan-tools
  mesa-utils
  hyprlock
  hyprcursor
  grim slurp swappy # screenshot
  libreoffice-fresh
  backlog.md
  rofi
  neovim
  ly
  stow
  tmux
)
MISSING=()
for pkg in "${DEPS[@]}"; do
  paru -Q "$pkg" &>/dev/null || MISSING+=("$pkg")
done
if [ ${#MISSING[@]} -gt 0 ]; then
  notify-send -t 6000 -u critical "Deps" "Missing: ${MISSING[*]}\nInstalling with paru..."
  ghostty -e paru -S "${MISSING[@]}"
fi
