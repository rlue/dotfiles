if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim VISUAL=nvim
  export MANPAGER="/bin/sh -c \"col -b | nvim -Mc 'runtime ftplugin/man.vim | set ft=man ro nomod nolist nonu iskeyword+=: | nunmap <buffer> q' -c 'nmap <silent> q :q!<CR> | lua vim.opt.showtabline = 0' -\""
elif command -v vim >/dev/null 2>&1; then
  if [ -r ${XDG_CONFIG_HOME:-$HOME/.config}/vim/vimrc ]; then
    export VIMINIT="set nocp | source ${XDG_CONFIG_HOME:-$HOME/.config}/vim/vimrc"
  fi
  export EDITOR=vim VISUAL=vim
  export MANPAGER="/bin/sh -c \"col -b | vim -Mc 'runtime ftplugin/man.vim | set ft=man ro nomod nolist nonu iskeyword+=: | nmap <silent> q :q!<CR>' -\""
else
  export EDITOR=vi VISUAL=vi
fi
