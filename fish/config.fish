set PATH $PATH $HOME/scripts/
set PATH $PATH $HOME/.local/bin
set PATH $PATH /opt/homebrew/bin
set PATH $PATH /opt/homebrew/sbin

set PATH $PATH $HOME/Library/apache-maven-3.9.5/bin/

set PATH $PATH $HOME/dotfiles/scripts/

set -gx EDITOR nvim

alias vim=nvim
alias v=nvim
alias vi=nvim
alias cd=z

fish_default_key_bindings

alias y=yazi
alias oo='cd $HOME/Dropbox/vault/'
alias pro='cd $HOME/01-projects/'
alias a='cd $HOME/Library/CloudStorage/OneDrive-ING/Documents/04-archive/'

# Neovim config alias
alias nvc='cd $HOME/dotfiles/nvim/lua/'


function ls; eza -1 -h --icons -a --no-user --group-directories-first -F $argv; end # preferred listing
function la; eza -1 -a --color=always --group-directories-first --icons $argv; end  # all files and dirs
function ll; eza -l --color=always --group-directories-first --icons $argv; end  # long format
function lt; eza -aT --color=always --group-directories-first --icons $argv; end # tree listing
function l.; eza -a | grep -E '^\.'; end # show only dotfiles

zoxide init fish | source
fzf --fish | source


# Setting PATH for Python 3.11
# The original version is saved in /Users/pu54xk/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"
