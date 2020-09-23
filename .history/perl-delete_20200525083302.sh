#!/usr/local/bin/bash
<<<<<<< HEAD
=======

# TODO: WORKS MOSTLY BUT NEEDS REFINEMENT

>>>>>>> a2917f57a50afef94cb68f3d955d84cbbc6938d4
# LOGGING
LOG="hunter_killer.log"
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3 RETURN
exec 1>$LOG 2>&1

# delete all files and folders under a directory with Perl for speed
USAGE="$0 <directory name>"
DIR=${1? $USAGE }
DEPTH=${2-2}
WORKING_DIR=""
FILE_KILLS=0
DIR_KILLS=0

set -e                      # halt on errors
if [[ $? != 0 ]] ; then
    exit 1 
fi

# set shell option to have * globs include .dotfiles
shopt -s dotglob
export GLOBIGNORE=".:.." # ignore parent and prev dir

########################################################
############ FUNCTIONS #################################
########################################################
# file and dir removal function
raze (){
    local f="${1}"                              # set a local var to hold dir name
    if [[ -d "${f}" ]] ; then                   # if $f is another dir recall raze (recursive function)
        echo "rmdir ${f}"
        perl -e 'rmdir($f)'
        [[ $? ]] && ((DIR_KILLS++))
    else    
        echo "unlinking ${f}"
        perl -e 'unlink($f)'
        [[ $? ]] && ((FILE_KILLS++))
    fi
}

# walk dirs looking for files to unlink function
walktree (){
    # set local dir var
    local d="${1}"
    WORKING_DIR=$("${WORKING_DIR}/${d}" | sed 's/\.\///g')
    #echo "working dir: ${WORKING_DIR}"
    cd "${d}"
    for g in ./* ; do
        if [[ -d "${g}" ]] ; then
            #echo "glob var in walktree function is dir: $g"
            #echo "walktree being called on $g"
            walktree "${g}"
        elif [[ -f "${g}" ]] ; then
            #echo "glob var in walktree function is file: $g"
            #echo "calling raze function against $g"
            raze "${g}"
        fi
    done
    cd ..
    raze "${d}"
    WORKING_DIR=$(dirname "${WORKING_DIR}" | sed 's/\.\///g')
}

# main script
function main {
    for DIR in "${DIRS[@]}"; do
        echo "found main dir: $DIR" >&3
        WORKING_DIR="${DIR}"
        echo "working dir $WORKING_DIR" >&3
        walktree "${DIR}"
    done
    echo "Script completed hunting and killing:" >&3
    echo "FILES KILLED: $FILE_KILLS" >&3
    echo "DIRECTORIES KILLED: $DIR_KILLS" >&3
    echo "TOTAL KILLED: $((FILE_KILLS + DIR_KILLS))" >&3
}

# use find to gather all the files and directories and then reverse sort them and pass to above perl
DIRS=( $(find . -type d -maxdepth 2 -name "${DIR}") )

main

return
exit 0