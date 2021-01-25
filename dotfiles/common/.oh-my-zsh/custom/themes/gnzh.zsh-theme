# Based on bira theme
# Custom gnzh theme

setopt prompt_subst

() {

local PR_PROMPT PR_PROMPT_1 PR_PROMPT_2
local PR_USER PR_USER_ICON PR_HOST PR_HOST_ICON PR_CUR_DIR PR_CUR_DIR_ICON
local PR_RET_CODE PR_RET_CODE_ICON


# custom colors (use print_term_colors to choose):
# don't forget $ before curly braces for custom colors!

# LOCAL
eval prompt_icon='$FG[121]'
eval prompt_line='$FG[121]'

eval username='$FG[121]'
eval username_icon='$FG[121]'

eval git_branch='$FG[208]'
eval git_branch_icon='$FG[208]'

eval current_dir='$FG[222]'
eval current_dir_icon='$FG[222]'

eval hostname='$FG[004]'
eval hostname_icon='$FG[004]'

eval ret_code='$FG[001]'
eval ret_code_icon='$FG[001]'

# SSH Connection
eval ssh_prompt_icon='$FG[001]'
eval ssh_prompt_line='$FG[240]'

eval ssh_username='$FG[250]'
eval ssh_username_icon='$FG[001]'

eval ssh_git_branch='$FG[250]'
eval ssh_git_branch_icon='$FG[001]'

eval ssh_current_dir='$FG[250]'
eval ssh_current_dir_icon='$FG[001]'

eval ssh_hostname='$FG[250]'
eval ssh_hostname_icon='$FG[001]'

eval ssh_ret_code='$FG[001]'
eval ssh_ret_code_icon='$FG[001]'

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_PROMPT='%F${ssh_prompt_icon}▶%f'
  PR_PROMPT_1='%F${ssh_prompt_line}┌─%f'
  PR_PROMPT_2='%F${ssh_prompt_line}└─%f'

  PR_USER='%F${ssh_username}%n%f'
  PR_USER_ICON='%F${ssh_username_icon} %f'
  PR_HOST='%F${ssh_hostname}%M%f'
  PR_HOST_ICON='%F${ssh_hostname_icon} %f'
  PR_CUR_DIR="%B%F${ssh_current_dir}%~%f%b"
  PR_CUR_DIR_ICON="%F${ssh_current_dir_icon} %f"
  ZSH_THEME_GIT_PROMPT_PREFIX="%F${ssh_git_branch_icon}%f%F${ssh_git_branch}‹"
  ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
  
  PR_RET_CODE="%F${ssh_ret_code}%?%f"
  PR_RET_CODE_ICON="%F${ssh_ret_code_icon}↵%f"
else
  PR_PROMPT='%F${prompt_icon}▶%f'
  PR_PROMPT_1='%F${prompt_line}┌─%f'
  PR_PROMPT_2='%F${prompt_line}└─%f'

  PR_USER='%F${username}%n%f'
  PR_USER_ICON='%F${username_icon} %f'
  PR_HOST='%F${hostname}%M%f'
  PR_HOST_ICON='%F${hostname_icon} %f'
  PR_CUR_DIR="%B%F${current_dir}%~%f%b"
  PR_CUR_DIR_ICON="%F${current_dir_icon} %f"
  ZSH_THEME_GIT_PROMPT_PREFIX="%F${git_branch_icon}%f%F${git_branch}‹"
  ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"

  PR_RET_CODE="%F${ret_code}%?%f"
  PR_RET_CODE_ICON="%F${ret_code_icon}↵%f"
fi

local return_code="%(?..$PR_RET_CODE $PR_RET_CODE_ICON)"
local user="$PR_USER_ICON$PR_USER"
local host="$PR_HOST_ICON$PR_HOST"
local current_dir="$PR_CUR_DIR_ICON$PR_CUR_DIR"
local git_branch='$(git_prompt_info)'

PROMPT="$PR_PROMPT_1 %f${user}$host ${current_dir} ${git_branch}
$PR_PROMPT_2$PR_PROMPT "
RPROMPT="${return_code}"

}
