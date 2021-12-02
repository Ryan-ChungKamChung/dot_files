parse_git_branch() {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='\u:\[\033[01;34m\]\w\[\033[33m\]$(parse_git_branch)\[\033[00m\]:'

PROMPT_DIRTRIM=1 #shows just the current directory name
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias claer='clear'
alias sl='swiftlint *.swift'
alias jl='java -jar ~/scripts/checkstyle.jar -c ~/scripts/mr-coxall_checks.xml ./*.java'
alias gpr='git pull origin main --rebase'

rc() {
    ~/scripts/repo-creation.sh $1 $2
}


gp() {
    git add *
    git commit -m "$1"
    git push origin main
}

export PATH="${PATH}":/usr/bin/swift/bin
export PATH="${PATH}":/usr/bin/swiftlint
