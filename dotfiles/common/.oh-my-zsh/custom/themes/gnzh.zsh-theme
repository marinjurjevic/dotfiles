# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

eval my_green='$FG[121]'
eval my_orange='$FG[208]'
eval my_yellow='$FG[228]'
eval my_gold='$FG[222]'
# eval my_blue='$FG[111]'

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%n'
  PR_USER_OP='%#'
  PR_PROMPT='▶'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}▶ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%M' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="%F${my_green} ${PR_USER}%f %F{blue} ${PR_HOST}%f"
local current_dir="%B%F${my_gold} %~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="%F${my_green}╭─ %f${user_host} ${current_dir} ${git_branch}
%F${my_green}╰─$PR_PROMPT %f"
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F${my_orange}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

}
