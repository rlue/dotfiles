# brew find: Interactively search-and-install formulae
if hash brew >/dev/null 2>&1; then
  function brew() {
    brew=$(whence -p brew)
    if hash rg >/dev/null 2>&1; then
      grepprg='rg'
    else
      grepprg='grep'
    fi

    case "$1" in
      find)
        fzf_opts=("--multi" "--query=$2" "--preview=$brew info {1}" "--preview-window=$([ $(tput lines) -gt $(tput cols) ] && printf right || printf up)")
        choice=$($brew search $2 | sed -f <($brew list | sed 's/.*/s\/^&$\/\& (installed)\//') | fzf "${fzf_opts[@]}" )

        if [ $? -eq 0 ] && [ -n "$choice" ]; then
          already_installed=$(echo "$choice" | $grepprg -F -x -f <($brew list) -)
          if [ $? -eq 0 ] && [ -n "$already_installed" ]; then
            echo "The following formulae are already installed:"
            echo $already_installed
          fi

          to_install=$(echo "$choice" | $grepprg -F -x -v -f <($brew list) -)
          if [ $? -eq 0 ] && [ -n "$to_install" ]; then
            $brew install $to_install
          else
            echo "No new formulae to install."
          fi
        fi
        ;;
      *) $brew "$@" ;;
    esac
  }
fi
