# turn off noclobber
set +o noclobber

# expand variables
shopt -s direxpand 2>/dev/null || true

alias wget="wget --no-check-certificate"

# aliases
alias ll="ls -lhv --group-directories-first --color"
alias vim="vim -p"

# aliases git abreviations
alias ga="git add --all"
alias go="git checkout"
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gg="git grep -n --color"
alias gl="git log --oneline --decorate"
alias gclean="git reset . && git checkout . && git clean -xdf"

# turn off noclobber
set +o noclobber

function _complete_make {
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
      return
    fi

    COMPREPLY=($(compgen -W "\`test -f Makefile && make list 2>/dev/null || echo ""\`" "${COMP_WORDS[1]}"))
}

export PS1="\h \[\033[32m\]\w\[\033[33m\]\[\033[00m\] $ "

# if want to see git branch on prompt line copy below lines to your ~/.bashrc
#
# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n$ "

complete -F _complete_make -o default make

# auto complete for git
source /etc/bash_completion.d/git
