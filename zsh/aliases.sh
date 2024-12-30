alias ls='lsd'
alias ll='ls -hla'
alias hibernate='systemctl hibernate -i'
alias v='nvim'
alias tms='tmux at -t sys'
alias pypy='pypy3'
alias kubectl='k'
alias libreoffice='libreoffice --safe-mode'

pingtime() {
    ping "$1" | while read -r pong; do echo "$(date +"%Y-%m-%d %T"): $pong"; done
}

open() {
    xdg-open "$1" &> /dev/null
}

upgrade() {
    if [[ $(cat /sys/class/power_supply/AC0/online) == "0" ]]; then
        echo "Please plug in to AC to run an upgrade."
        return 1
    fi
    yay && sudo pacman -Scc
}
