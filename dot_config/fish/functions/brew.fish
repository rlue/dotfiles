# brew find: Interactively search-and-install formulae
if command -q brew
  function brew
    set -l brew (type -fp brew)

    if command -q rg
      set -f grepprg rg
    else
      set -f grepprg grep
    end

    switch "$argv[1]"
      case find
        set -l fzf_opts "--multi" "--query=$argv[2]" "--preview=$brew info {1}" "--preview-window=$([ (tput lines) -gt (tput cols) ]; and printf right; or printf up)"
        set -l choice ($brew search $argv[2] | sed -f ($brew list | sed 's/.*/s\/^&$\/\& (installed)\//' | psub) | fzf $fzf_opts )

        if [ $status -eq 0 ] && [ -n "$choice" ]
          set -l already_installed (echo "$choice" | $grepprg -F -x -f ($brew list | psub) -)
          if [ $status -eq 0 ] && [ -n "$already_installed" ]
            echo "The following formulae are already installed:"
            echo $already_installed
          end

          set -l to_install (echo "$choice" | $grepprg -F -x -v -f ($brew list | psub) -)
          if [ $status -eq 0 ] && [ -n "$to_install" ]
            $brew install $to_install
          else
            echo "No new formulae to install."
          end
        end
      case '*'
        $brew $argv
    end
  end
end
