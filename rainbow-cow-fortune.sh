# fun fortune greeting
GAMES=/usr/games
set -- "fortune" "cowsay" "lolcat"
if [ -d "$GAMES" ]; then
  # declare some variables
  CHECK="true"
  declare -a MISSING=

  # loop through app list
  for g in $@; do
    if [ -f "$GAMES/$g" ] && [ "$CHECK" == "true" ]; then
      CHECK="true"
    else
      CHECK="false"
      MISSING+=("$GAMES/$g")
    fi
  done

  # execute if CHECK is good, otherwise report missing app
  if [ $CHECK == "true" ]; then
    fortune | cowsay | lolcat
  else
    echo "One or more apps aren't detected on your system!"
    echo "Apps searched for: $@"
    echo "Missing app: ${MISSING[0]}"
  fi
fi
