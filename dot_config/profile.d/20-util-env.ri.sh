export RI=-afansi

if [ -d "$HOME/.local/share/nvim/plugged/vim-plugin-AnsiEsc" ]; then
  export RI_PAGER="nvim -Mc 'set nonumber | nnoremap <buffer> <silent> q :q!<CR> | AnsiEsc' -"
elif [ -d "$HOME/.config/vim/plugged/vim-plugin-AnsiEsc" ]; then
  export RI_PAGER="vim -Mc 'set nonumber | nnoremap <buffer> <silent> q :q!<CR> | AnsiEsc' -"
fi
