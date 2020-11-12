destroy () { 
    local -n variable=$1
    declare -p $1 &>/dev/null || return -1 # Return if variable not exist
    local resline result flags=${variable@a}
    [ -z "$flags" ] || [ "${flags//*r*}" ] && { 
        unset $1    # Don't run gdb if variable is not readonly.
        return $?
    }
    while read resline; do
        [ "$resline" ] && [ -z "${resline%\$1 = *}" ] &&
            result=${resline##*1 = }
    done < <(
        gdb 2>&1 -ex 'call unbind_variable("'$1'")' --pid=$$ --batch
    )
    return $result
}
