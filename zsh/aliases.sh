alias ls='lsd'
alias ll='ls -hla'
alias hibernate='reset && rfkill block bluetooth && systemctl hibernate -i && reset'
alias v='nvim'
alias tms='tmux at -t sys'
alias pypy='pypy3'
alias kubectl='k'

pingtime() {
    ping "$1" | while read pong; do echo "$(date +"%Y-%m-%d %T"): $pong"; done
}

open() {
    xdg-open $1 &> /dev/null
}

upgrade() {
    if [[ $(cat /sys/class/power_supply/AC0/online) == "0" ]]; then
        echo "Please plug in to AC to run an upgrade."
        return 1
    fi
    yay && sudo pacman -Scc
}
