if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -d ~/bin ]]; then
    PATH="$PATH:$HOME/bin"
fi

if [[ -f ~/.local.sh ]]; then
    source ~/.local.sh
fi

