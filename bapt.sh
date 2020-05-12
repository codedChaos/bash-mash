#!/bin/bash

# UGLY WORK IN PROGRESS 

function bapt() {
    # halt on errors
    set -e
    echo "inside function"
    APT_HELP="/usr/bin/apt help"
    APT_INSTALL_HELP="/usr/bin/apt install help"

    # dump passed args to array variable
    if [ $#  > 1 ]; then
        echo "more than one arg"
        args=("$@")
    else
        echo "not enough args"
        eval "$APT_HELP"
        exit 1
    fi

    # first argument should be the apt command the user wants to run
    aptcmd="${args[0]}"
    echo ""
    echo "aptcmd: $aptcmd"
    echo "args: ${args[@]}"
    echo ""
    unset "args[$1]"
    echo ""
    echo "after unset"
    echo "args: ${args[@]}"
    echo ""

    # test command argument. ONLY WORKING WITH "INSTALL" cmd for NOW
    case "${aptcmd}" in         # TODO: Add support for more apt commands
    install) #do stuff
        echo "running install on ${args[@]}"
        ;;
    *)
        echo "That command is unsupported with bapt() at this time."
        eval "$APT_INSTALL_HELP"
        exit 1
        ;;
    esac

    sudo bash -c "apt $aptcmd ${args[@]} -y >/dev/null 2>&1 & disown"

    until [ $? == 1 ]; do    # FIXME: broken loop never exits
        sleep 1
        echo "Waiting for install to finish..."
        echo "...${?}"
        $(/usr/bin/pgrep apt >/dev/null) &
    done

    echo "Installation of ${args[@]} is now completed."
    set +e
}

if [ $# ] >1; then
    bapt $@
else
    echo "not enough arguments passed"
fi
