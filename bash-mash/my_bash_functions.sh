#!/bin/bash

# bapt() is a function that will run an `apt install` command in the background to free up your terminal
function bapt() {
    SCRIPT_ID=$$
    SHELL_ID=$BASHPID
    MSG_PREFIX="$SHELL_ID -- $SCRIPT_ID : "
    declare -a help_msg=()
    help_msg+=("$MSG_PREFIX")
    help_msg+=("Not enough args passed to function. Need 2 or more arguments.")
    help_msg+=("USAGE: bapt <install> <appname>")
    help_msg+=("The first arg passed above is the word 'install' which is the same as saying")
    help_msg+=("sudo apt install")
    help_msg+=("the second arguments and onward are the app names and/or options")
    help_msg+=("")

    # dump passed args to array variable
    if [[ $# -gt 1 ]]; then
        logger -s "$MSG_PREFIX More than 1 argument was passed correctly. Script continuing."
        args=("$@") # capturing passed arguments for future usage
    elif [ $# -eq 1 ] && [ $1 == 'dist-upgrade' ]; then
        logger -s "$MSG_PREFIX dist-upgrade accepted. Script continuing."
        args=("$@") # capture all args for use
    else
        logger -s "$MSG_PREFIX ${help_msg[*]}"
        return 1
    fi

    # test command argument. ONLY WORKING WITH "INSTALL" cmd for NOW
    case "$1" in
    install)
        logger -s "$MSG_PREFIX" "Running install on ${args[*]:1}"
        ;;
    dist-upgrade)
        logger -s "$MSG_PREFIX" "Running dist-upgrade."
        ;;
    *)
        logger "$MSG_PREFIX That command is unsupported with bapt() at this time."
        logger "$MSG_PREFIX HELP MESSAGE: ${help_msg[*]}"
        return 1
        ;;
    esac

    sudo bash -c "apt $* -y >/dev/null 2>&1 & disown"
    #apt_procID=$! # doesn't work because of the second shell being called

    #logger "$MSG_PREFIX apt Proces ID: $apt_procID"

    # if [ "$(pgrep apt)" ]; then
    #     logger "INFO: $0 : apt_procid = $(pgrep apt)"
    #     sudo bash -c "stalk apt >/dev/null 2>&1 & disown"
    # fi
    stalk apt &
    disown
}

# monitor process in the background and report when it closes
function stalk() {
    if [ $# == 1 ]; then
        logger -s "INFO: $0 : SUCCESS; starting with $# arguments"
        logger -s "INFO: $0 : starting monitor for $1"
    else
        logger -s "ERROR: $0 : FAILED to start with $# arguments"
    fi
    count=1
    pass=0
    while [ -n "$(pgrep $1)" ]; do
        logger "INFO: $0 : monitoring $1 for closure. Sleep $(calc $count*2) seconds."
        sleep "$(calc $count*2)"
        if [ $count -lt 30 ] && [ $pass -eq 0 ]; then
            ((count++))
        else
            pass=1
            ((count--))
        fi
        if [ ! "$(pgrep $1)" ]; then # not concerned about globbing or word splitting here
            logger -s "INFO: $0 : process not found. monitoring stopped for $1"
            break
        fi
    done
}

# reload these functions but compare dates and times with multiple versions of same file
# that you're sourcing. basically using this for multiple bash functions files that I have
# maybe I'll find a better use for it later.
function ffreload() {
    case $# in
    1) #do stuff
        echo "loading $1"
        stat $1
        #. "$1"
        ;;
    2) # 2 file comparison
        if [ -r "$1" ] && [ -r "$2" ]; then
            if [ "$1" -nt "$2" ]; then
                echo "loading $1"
                stat $1
                #. "$1"
            else
                echo "loading $2"
                stat $2
                #. "$2"
            fi
        fi
        ;;
    *) # do default exit
        echo "incorrect number of files!"
        echo "this function accepts 1 to 2 files only"
        return 1
        ;;
    esac
}

# calc function
function calc() {
    local a
    (($# > 0)) && a="$@" || read -r -p "calc: " a
    bc -l <<<"$a"
}

# Separate way to fail out of a function without exiting the shell
function fail() {
    : "${__fail_fast:?$1}"
}

# may not use this and instead use Logger
function echoerr() {
    printf "%s\n" "$*" >&2
}

# Function to mkdir and change to it
function mcd() {
    mkdir -p $1
    cd $1
}

# sha checksum functions
function sha256() {
    echo "$1 $2" | sha256sum --check
}

function sha512() {
    echo "$1 $2" | sha512sum --check
}

# ps with grep function
function psgrep() {
    ps up $(pgrep -f $@) 2>&-
}

# Extract function that utilizes lots of different archive tools to extract almost any type of archive
function extract() {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
        return 1
    else
        for n in $@; do
            if [ -f "$n" ]; then
                case "${n%,}" in
                *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
                    tar xvf "$n"
                    ;;
                *.lzma) unlzma ./"$n" ;;
                *.bz2) bunzip2 ./"$n" ;;
                *.rar) unrar x -ad ./"$n" ;;
                *.gz) gunzip ./"$n" ;;
                *.zip) unzip ./"$n" ;;
                *.z) uncompress ./"$n" ;;
                *.7z | *.arj | *.cab | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.rpm | *.udf | *.wim | *.xar)
                    7z x ./"$n"
                    ;;
                *.xz) unxz ./"$n" ;;
                *.exe) cabextract ./"$n" ;;
                *)
                    echo "extract: '$n' - unknown archive method"
                    return 1
                    ;;
                esac
            else
                echo "'$n' - file does not exist"
                return 1
            fi
        done
    fi
}

# history Averager to find useful commands to turn into functions
function histavg() {
    results="$(history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10)"
    echo "$results"
}

# fortune told by rainbow cow
function rainbow_cow_fortune() {
    # variables for app lookup
    GAMES=/usr/games
    set -- "fortune" "cowsay" "lolcat"

    if [ -d "$GAMES" ]; then
        # declare some variables
        CHECK="true"
        declare -a MISSING

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
}

# trim leading and trailing whitepace
function trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"

    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s\n' "$var"
}
