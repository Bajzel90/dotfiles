export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="amuse"

ENABLE_CORRECTION="false"

plugins=(git azure fzf iterm2 poetry poetry-env)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:/opt/homebrew/bin
alias vim=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
source /opt/homebrew/etc/bash_completion.d/az

alias ls=eza
alias python=python3

eval "$(zoxide init --cmd cd zsh)"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

