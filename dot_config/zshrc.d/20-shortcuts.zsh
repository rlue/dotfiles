# Shortcuts (aliases & functions) ----------------------------------------------
hash broot         >/dev/null 2>&1 && eval "$(broot --print-shell-function zsh)" >/dev/null 2>&1
hash git           >/dev/null 2>&1 && alias cdr='git status >/dev/null 2>&1 && cd $(git rev-parse --show-toplevel) || cd' # cd to root of git repo
hash cmatrix       >/dev/null 2>&1 && alias cmatrix="tmux set status off; tmux resize-pane -Z; cmatrix; tmux resize-pane -Z; tmux set status on"
hash rg            >/dev/null 2>&1 && alias grep='rg'
hash exa           >/dev/null 2>&1 && alias ls='exa'
hash eza           >/dev/null 2>&1 && alias ls='eza'
hash ncdu          >/dev/null 2>&1 && alias ncdu='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
hash xdg-open      >/dev/null 2>&1 && alias open='xdg-open'
hash prettyping    >/dev/null 2>&1 && alias ping='prettyping --nolegend'
hash timer         >/dev/null 2>&1 && alias pmdr='TIMER_VOLUME=0 timer -d $(echo "1800 - $(date +%s) % 1800" | bc) 29.5 0.5 29.5 0.5 20 10'
hash totp-cli      >/dev/null 2>&1 && alias totp='TOTP_TOKEN="$(</dev/stdin | sed -e '"'"'s/.*secret=\([^&]\+\).*/\1/'"'"')" totp-cli instant'
hash vd            >/dev/null 2>&1 && alias vdank="vd --header 0 --confirm-overwrite=F"
hash nvim          >/dev/null 2>&1 && alias vim='nvim'
