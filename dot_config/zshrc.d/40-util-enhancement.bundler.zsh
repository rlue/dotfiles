alias b='bundle exec'
alias bj='bundle exec jekyll'

# Support for local gemfiles via $BUNDLE_GEMFILE env var
function bundle() {
  bundle="$(whence -p bundle)"
  project_root="$(git rev-parse --show-toplevel 2>/dev/null)/"
  local_gemfile="$(realpath "$BUNDLE_GEMFILE" 2>/dev/null)" # NOTE: not OSX-portable

  if [ -r "$local_gemfile" ] && [ -r "${project_root}Gemfile" ] &&
     ! [[ "$local_gemfile" =~ $(printf %s '\bGemfile$') ]] &&
     [[ "$1" =~ ^(|install|update)$ ]]; then
    BUNDLE_GEMFILE="${project_root}Gemfile" "$bundle" "$@"
    cp "${project_root}Gemfile.lock" "$local_gemfile.lock"
  fi

  "$bundle" "$@"
}
