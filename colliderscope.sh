#!/bin/bash
# WORK IN PROGRESS
# display network interface collision statistics

# get all available network dev listing commands using array
# declare -a CMDs=()
# CMDs+=$($(IFCONFIG=$(which ifconfig); echo $IFCONFIG))
# CMDs+=$($(IP=$(which ip); echo $IP))
# CMDs+=$($(NM=$(which nmcli); echo $NM))

# get all available network dev listing commands using associative array
declare -A CMDs
CMDs[IFCONFIG]="$(which ifconfig)"
CMDs[IP]="$(which ip)"
CMDs[NM]="$(which nmcli)"
NICs=()

for cmd in "${!CMDs[@]}"; do
    [ -z ${CMDs[$cmd]} ] && unset CMDs[$cmd]
done

if [ ${#CMDs[@]} -gt 0 ]; then
    # choose command to run
    KEYS=(${!CMDs[@]})
    case $(basename ${CMDs[${KEYS[0]}]}) in
    ip)
        # BUG: sub-command isn't functioning, throws a 'grep' is a garbage error
        # but if you run the cmd as it is without the outside (), it works just fine
        # need to scour forums and post a question on stack overflow
        # I'm sure it's something to do with the way variables and quotes are parsed and
        # interpolated in the sub-command.

        # BUGFIX-ISSUE #1: eval may fix the sub-command interpolation issue
        for nic in eval '${CMDs[IP]} link show | grep ^[^1]: | cut -d" " -f2 | tr ":" "\n" | awk NF'; do
            NICs+=("$nic")
        done
        ;;
    nmcli)
        # do nmcli command
        for nic in eval "${CMDs[NM]} device show | grep -i device | xargs | tr ' ' '\n' | grep -e 'GENERAL\|lo' -v"; do
            NICs+=($nic)
        done
        ;;
    ifconfig)
        # do ifconfig command
        for nic in eval "${CMDs[IFCONFIG]} | cut -d ' ' -f1 | tr ':' '\n' | awk NF"; do
            NICs+=($nic)
        done
        ;;
    *)
        # do catch-all
        echo "no command available"
        exit 255
        ;;
    esac
else
    return 255
fi

for nic in "${NICs[@]}"; do
    echo "$nic"
    netstat -i | grep ^$nic | awk '{print $9 / $7 }' 2>/dev/null
done
