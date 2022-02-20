#!/usr/bin/env bash
#######################################################################
## DESCRIPTION: This script installs the .NET Core Framework on Linux #
#######################################################################

##############################
######    LICENSE       ######
##############################
showLicense() {
    TAB="$(printf '\t')"
cat <<- LICENSE
    ${TAB} Copyright 2022 \"William J Smyth\" \©
    
    ${TAB} Permission is hereby granted, free of charge, to any person obtaining a copy of this
    ${TAB} software and associated documentation files \(the \"Software\"\), to deal in the Softwar
    ${TAB} without restriction, including without limitation the rights to use, copy, modify, merge,
    ${TAB} publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
    ${TAB} to whom the Software is furnished to do so, subject to the following conditions:
    
    ${TAB}${TAB} The above copyright notice and this permission notice shall be included in all
    ${TAB}${TAB} copies or substantial portions of the Software or substantial portions of the Software.
    
    ${TAB}${TAB} THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED
    ${TAB}${TAB} INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
    ${TAB}${TAB} PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
    ${TAB}${TAB} HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
    ${TAB}${TAB} CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
    ${TAB}${TAB} OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
LICENSE
}

##########################################################################################
# HELP FUNCTIONS                                                                         #
##########################################################################################
Help() {
    echo PROGRAM NAME:  "${0##*/}"
cat << EOF
    Description: Install .NET SDK for Linux via Apt source configuration

    [SYNTAX]
        $ $0 [-L|h|c|d|v|r|V|D]

    [OPTIONS]
        -L,                                     Print the license notification
        -h,                                     Print this HelpMsg
        -c </full/path/to/lsb_release>,         Set full-path to 'lsb_release' command (ex. /usr/bin/lsb_release [defualt])
        -d <distro>,                            Set distro name to search for in repo (ex. ubuntu, debian, redhat, ...)
        -v,                                     Set verbose level (ex. [-v] #default 0)
        -r <release>,                           Set release for download (ex. -d ubuntu -r {trusty, focal, impish, ...})
        -V,                                     Print Version information
        -D </full/path/for/download>,           Set full-path to use for download directory (ex. /home/<username>/Downloads [defualt])
EOF
}
##########################################################################################

MAIN() {
    ##########################################################################################
    # Main Program                                                                           #
    ##########################################################################################

    # Get command line arguments/options
    while getopt -n "${0##*/}" -o 'hLVc::d::v::r::' $@; do
        #echo "option: ${option}"
        case $ARG in
            L)  # print license information
                # echo "print license info"
                L=${OPTARG}
                showLicense
                exit 0
                ;;
            \? | h | *) # display this help message
                h=${ARG}
                Help
                [ "${h}" = "h" ] && exit 0 || exit 1001
                ;;
        esac
    done
    shift $((OPTIND-1))

    #LSB_RELEASE_CMD="${c:/usr/bin/lsb_release}" # allow user to specify path to lsb_release command on command line in first argument position
    # echo Command: "${LSB_RELEASE_CMD}"

    # Change to your Home Downloads directory
    DOWNLOAD_DIR="${2:-${HOME}/Downloads}"
    cd "${DOWNLOAD_DIR}"
    echo "$(pwd)"

    # Pull down the .deb file for your distro release **IF IT EXISTS**
    # wget "https://packages.microsoft.com/config/$(lsb_release -is)/$(lsb_release -rs)/packages-microsoft-prod.deb -O ./packages-microsoft-prod.deb"

    # Instlal the .deb file using dpkg
    # sudo dpkg -i ./packages-microsoft-prod.deb

    # if no errors from install, clean up downloaded files
    # if [ $? -ne 0 ]; then
    #     rm -f ./packages-microsoft-prod.deb
    # fi
}

MAIN