function cdr
  git status >/dev/null 2>&1 && cd (git rev-parse --show-toplevel)
  or cd
end
