# Shortcuts (aliases & functions) ----------------------------------------------
hash broot         >/dev/null 2>&1 && eval "$(broot --print-shell-function bash)" >/dev/null 2>&1
hash git           >/dev/null 2>&1 && alias cdr='git status >/dev/null 2>&1 && cd $(git rev-parse --show-toplevel) || cd' # cd to root of git repo
hash chezmoi       >/dev/null 2>&1 && alias cm='chezmoi'
hash cmatrix       >/dev/null 2>&1 && alias cmatrix="( caffeine & ) >/dev/null 2>&1; tmux set status off; tmux resize-pane -Z; i3 fullscreen enable >/dev/null; cmatrix; i3 fullscreen disable >/dev/null; tmux resize-pane -Z; tmux set status on; pkill -f caffeine"
hash docker        >/dev/null 2>&1 && alias dc='docker compose'
hash rg            >/dev/null 2>&1 && alias grep='rg'
hash khal          >/dev/null 2>&1 && alias kh='khal'
hash exa           >/dev/null 2>&1 && alias ls='exa'
hash ncdu          >/dev/null 2>&1 && alias ncdu='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
hash xdg-open      >/dev/null 2>&1 && alias open='xdg-open'
hash prettyping    >/dev/null 2>&1 && alias ping='prettyping --nolegend'
hash timer         >/dev/null 2>&1 && alias pmdr='TIMER_VOLUME=0 timer -d $(echo "1800 - $(date +%s) % 1800" | bc) 29.5 0.5 29.5 0.5 20 10'
hash timer         >/dev/null 2>&1 && alias timer='timer -p'
hash totp-cli      >/dev/null 2>&1 && alias totp='TOTP_TOKEN="$(</dev/stdin | sed -e '"'"'s/.*secret=\([^&]\+\).*/\1/'"'"')" totp-cli instant'
hash vd            >/dev/null 2>&1 && alias vdank="vd --header 0 --confirm-overwrite=F"
hash nvim          >/dev/null 2>&1 && alias vim='nvim'

# vim: ft=sh
