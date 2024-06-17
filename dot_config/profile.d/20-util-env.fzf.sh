# via https://github.com/junegunn/fzf/issues/1437#issuecomment-626356301
if command -v fzf >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND="`(command -v fd >/dev/null 2>&1 && printf 'fd --type f --hidden --follow --exclude .git --exclude node_modules --strip-cwd-prefix') || \
                               (command -v rg >/dev/null 2>&1 && printf 'rg --files') || \
                               (command -v ag >/dev/null 2>&1 && printf 'ag -g ""')`"
  export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi
