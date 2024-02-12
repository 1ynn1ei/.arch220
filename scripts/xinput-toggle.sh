is_enabled() {
  enabled=$(
    xinput --list-props "$(xinput --list --name-only |
      grep "$1" | head -n 1)" |
      grep '\bDevice Enabled\b' |
      sed 's/.*\(.\)$/\1/'
    )
  return "$(( !enabled ))"
}

enable() {
  xinput --enable "$(xinput --list --name-only | grep "$1" | head -n 1)"
}

disable() {
  xinput --disable "$(xinput --list --name-only | grep "$1" | head -n 1)"
}

toggle() {
  if is_enabled "$1"; then
    disable "$1"
  else
    enable "$1"
  fi
}

toggle $1
