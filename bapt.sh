#!/bin/bash

function bapt() {
    SCRIPT_ID=$$
    SHELL_ID=$BASHPID
    MSG_PREFIX="$SHELL_ID -- $SCRIPT_ID : "
    declare -a help_msg=()
    # dump passed args to array variable
    if [[ $# -gt 1 ]]; then
        logger -s "$MSG_PREFIX More than 1 argument was passed correctly. Script continuing."
        args=("$@") # capturing passed arguments for future usage
    else
        help_msg+=("$MSG_PREFIX")
        help_msg+=("Not enough args passed to function. Need 2 or more arguments.")
        help_msg+=("USAGE: bapt <install> <appname>")
        help_msg+=("The first arg passed above is the word 'install' which is the same as saying")
        help_msg+=("sudo apt install")
        help_msg+=("the second arguments and onward are the app names and/or options")
        help_msg+=("")
        echo "$MSG_PREFIX ${help_msg[@]}"
        return 1
    fi

    # test command argument. ONLY WORKING WITH "INSTALL" cmd for NOW
    case "$1" in
    install)
        logger -s "$MSG_PREFIX" "Running install on ${args[@]:1}"
        ;;
    *)
        logger "$MSG_PREFIX That command is unsupported with bapt() at this time."
        logger "$MSG_PREFIX HELP MESSAGE: $help_msg[@]"
        return 1
        ;;
    esac

    sudo bash -c "apt $* -y >/dev/null 2>&1 & disown"
    apt_procID=$!

    logger "$MSG_PREFIX apt Proces ID: $apt_procID"

    if [ -z $apt_procID ]; then
        return $apt_procID
    else
        return 1
    fi
}

if [ $# -gt 1 ]; then
    bapt $*
fi
