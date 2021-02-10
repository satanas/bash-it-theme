function git_info_wrapper() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo ' %B%{$fg[red]%}±%{$reset_color%}%b $(git_prompt_info)'
  else
    echo ''
  fi
}

function git_sha() {
  echo ' %{$fg[yellow]%}$(git_prompt_short_sha)%{$reset_color%}'
}

function user_info() {
  echo '%{$fg[green]%}%n@%m%{$reset_color%}'
}

PROMPT='[$(user_info) %1/$(git_info_wrapper)]$ '
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$(git_sha) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="$(git_sha) %{$fg[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="$(git_sha) %{$fg[yellow]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$(git_sha) %{$fg[yellow]%}!%{$reset_color%}"
