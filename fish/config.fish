set PATH $PATH $HOME/scripts/
set PATH $PATH $HOME/.local/bin
set PATH $PATH /opt/homebrew/bin
set PATH $PATH /opt/homebrew/sbin

set -gx EDITOR nvim

alias vim=nvim
alias v=nvim
alias vi=nvim

fish_default_key_bindings

alias y=yazi
alias oo='cd $HOME/Dropbox/vault/'

# Neovim config alias
alias nvc='cd $HOME/dotfiles/nvim/lua/'


function ls; eza -1 -h --icons -a --no-user --group-directories-first -F $argv; end # preferred listing
function la; eza -1 -a --color=always --group-directories-first --icons $argv; end  # all files and dirs
function ll; eza -l --color=always --group-directories-first --icons $argv; end  # long format
function lt; eza -aT --color=always --group-directories-first --icons $argv; end # tree listing
function l.; eza -a | grep -E '^\.'; end # show only dotfiles

zoxide init fish | source
fzf --fish | source

