export EDITOR=vi
export TERM="screen-256color"
export LANG=en_US.UTF-8

# fix history size
HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE

if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

# add git branch to prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'git[%b] '
setopt PROMPT_SUBST
PROMPT='%n@%m %1~ ${vcs_info_msg_0_}%# '

function gcm() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in main trunk; do
    if command git show-ref -q --verify refs/heads/$branch; then
      git checkout $branch
      return
    fi
  done
  git checkout master
}

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=${PATH}:$JAVA_HOME/bin

# android
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# python
export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# yarn
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
