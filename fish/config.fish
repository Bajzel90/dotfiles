set PATH $PATH $HOME/scripts/
set PATH $PATH $HOME/.local/bin
set PATH $PATH /opt/homebrew/bin
set PATH $PATH /opt/homebrew/sbin

alias vim=nvim
alias v=nvim
alias vi=nvim


function ls; eza -1 -h --icons -a --no-user --group-directories-first -F $argv; end # preferred listing
function la; eza -1 -a --color=always --group-directories-first --icons $argv; end  # all files and dirs
function ll; eza -l --color=always --group-directories-first --icons $argv; end  # long format
function lt; eza -aT --color=always --group-directories-first --icons $argv; end # tree listing
function l.; eza -a | grep -E '^\.'; end # show only dotfiles

zoxide init fish | source
fzf --fish | source
