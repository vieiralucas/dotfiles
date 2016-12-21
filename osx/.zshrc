# .zshrc
autoload -U promptinit; promptinit
prompt pure

if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -d ~/bin ]]; then
    PATH="$PATH:$HOME/bin"
fi

if [[ -f ~/.local.sh ]]; then
    source ~/.local.sh
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
