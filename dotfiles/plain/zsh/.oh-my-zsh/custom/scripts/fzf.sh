#!/bin/bash

# Pass selected files as arguments to the given command
# Usage: f echo
# Usage: f vim
f() {
  IFS=$'\n'
  files=($(fd . --type f --type l "${@:2}" | fzf -0 -1 -m))
  IFS=$' '
  [[ -n "$files" ]] && $1 "${files[@]}"
}

# Pass selected directories as arguments to the given command
# Usage: d ws
d() {
  IFS=$'\n'
  dirs=($(fd . --type d "${@:2}" | fzf -0 -1 -m))
  IFS=$' '
  [[ -n "$dirs" ]] && $1 "${dirs[@]}"
}

# # Open the selected files with selected editor
# #   - CTRL-V to open with VSCode
# #   - CTRL-S to open with VSCode
# #   - Enter (default) to open with $EDITOR
fe() {
  local out files key
  IFS=$'\n'
  out=("$(fzf-tmux --query="$1" --multi --exit-0 --expect=ctrl-v,ctrl-s)")
  key=$(head -1 <<< "$out")
  files=($(tail -n +2 <<< "$out"))
  if [ -n "$files" ]; then
    if [ "$key" = ctrl-v ]; then code "${files[@]}";
    elif [ "$key" = ctrl-s ]; then subl "${files[@]}";
    else ${EDITOR} "${files[@]}";
    fi
  fi
}

# fcd - cd to selected directory
# Similar to default ALT+C fzf key binding
fcd() {
  local dir
  dir=$(fd --type d --follow . ${1:-.} | fzf +m) && cd "$dir"
}

# cd to selected parent dir
cdp(){
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(dirname "$(realpath "$PWD")") | fzf-tmux)
  cd "$DIR"
}

