# via https://jvns.ca/blog/2020/06/28/entr/

if hash fd >/dev/null 2>&1 && hash entr >/dev/null 2>&1; then
  function watch-build-repeat() {
    TIME_WRAPPER="$(which time) -f 'Rebuild complete (%e secs)'"

    while [ -z "$WBR_FINISHED" ]; do
      fd | entr -d zsh -c "$TIME_WRAPPER $@; tput bel" && WBR_FINISHED=1
    done

    unset WBR_FINISHED
  }

  alias wbr="watch-build-repeat"
fi
