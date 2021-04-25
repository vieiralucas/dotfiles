# You at on theme for oh-my-zsh

PROMPT='%{$fg[cyan]%}$(whoami) %{$fg[cyan]%}% %{$fg[blue]%}at %{$fg[blue]%}% %{$fg[yellow]%}$(hostname -s) %{$fg[yellow]%}% %{$fg[blue]%}on%{$fg[blue]%}% %p%{$fg[green]%} %~ $(git_prompt_info)% 
%{$fg[blue]%}> %{$fg[blue]%}% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN="] %{$fg[green]%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="] %{$fg[red]%}✘ "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
