export FPATH="$HOME/.zsh/func:$FPATH"

# prompt
setopt PROMPT_SUBST
autoload -U promptinit; promptinit
# prompt pure
prompt grb

if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -d ~/bin ]]; then
    PATH="$PATH:$HOME/bin"
fi

if [[ -f ~/.local.sh ]]; then
    source ~/.local.sh
fi

# history stuff
export HISTSIZE=10000
bindkey '^R' history-incremental-search-backward

# vi mode
# bindkey -v

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
