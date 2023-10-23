# Custom prompt
local basedir=${${(%):-%x}:P:h}
source $basedir/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
autoload -U colors && colors

function precmd() {
    echo -ne "\033]0;%M@%n %~\007"
    local GIT_THING=`__git_ps1 " \uE085 %s"`
    local VENV_THING="%{$fg[cyan]%}"`[ -n $VIRTUAL_ENV ] && echo $VIRTUAL_ENV_PROMPT`"%{$reset_color%}"
    # VTE_PWD_THING=`__vte_osc7`

    local PROMPT_ICON="%{$fg_bold[gray]%}["$'\uE11F'" %{$reset_color%} "
    PROMPT=$PROMPT_ICON$VENV_THING"%{$fg_bold[cyan]%}%M@%n%{$reset_color%} %{$fg_bold[white]%}%%:%{$reset_color%} "

    RPROMPT="%{$fg_bold[gray]%}%~%{$reset_color%} %{$fg_bold[green]%}"$GIT_THING"%{$reset_color%}"
}

