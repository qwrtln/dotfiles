alias g='git'
alias hibernate='systemctl hibernate -i && reset'
alias j='jj'
alias k='kubectl'
alias libreoffice='libreoffice --safe-mode'
alias ll='ls -hla'
alias ls='lsd'
alias pypy='pypy3'
alias tms='tmux at -t sys'
alias v='nvim'
alias yd='yazi ~/Downloads'

pingtime() {
    ping "$1" | while read -r pong; do echo "$(date +"%Y-%m-%d %T"): $pong"; done
}

open() {
    xdg-open "$1" &> /dev/null
}

files() {
    (nautilus "$1" &> /dev/null &)
}

upgrade() {
    if [[ $(cat /sys/class/power_supply/AC0/online) == "0" ]]; then
        echo "Please plug in to AC to run an upgrade."
        return 1
    fi
    yay && sudo pacman -Scc
}
