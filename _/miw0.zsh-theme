# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Based on ys theme

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✖︎"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}●"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# locked in info
local lockedin_info='$(get_lockedin_info)'
get_lockedin_info() {
	json=$(curl -s 'http://zz-cd-import.em.lan/loggedIn/1165')

	# fallback when api is down ($json doesn't start with curly brace)
	if [[ $json != \{* ]]; then
		json='{ "time": "00:00:00", "loggedIn": "x" }'
	fi;

	lastActive="$(echo $json | python -c 'import json,sys; obj=json.load(sys.stdin); print obj["time"]')"
	loggedIn="$(echo $json | python -c 'import json,sys; obj=json.load(sys.stdin); print obj["loggedIn"]')"

	if [[ "$loggedIn" == "True" ]]; then
		loggedIn="%{$fg[green]%}(K)%{$reset_color%}"
	elif [[ $loggedIn == "False" ]]; then
		loggedIn="%{$fg[red]%}(G)%{$reset_color%}"
	else
		loggedIn="%{$fg[white]%}(-)%{$reset_color%}"
	fi;

	echo "%{$fg[blue]%}∞%{$reset_color%} $loggedIn %{$fg[magenta]%}$lastActive%{$reset_color%}";
}

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] ~ LOCKEDIN LASTACTIVE \n $
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*] \
$lockedin_info $fg[blue]%}#%{$reset_color%}
%{$terminfo[bold]$fg[red]%}♥ %{$reset_color%}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[cyan]%}%{$fg[black]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*] \
$lockedin_info $fg[blue]%}#%{$reset_color%}
%{$terminfo[bold]$fg[red]%}♥ %{$reset_color%}"
fi
