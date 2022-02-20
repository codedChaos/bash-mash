#!/usr/env bash

# function for gnome-extensions actions

### BASH HISTORY NOTES FOR FUNCTION
# mapfile -t gEXTs <<<"$( echo | gnome-extensions list )"
# echo "${#gEXTs[@]
# echo "${#gEXTs[@]}
# echo "${#gEXTs[@]}"
# echo "${gEXTs[@]}"
# echo "${gEXTs[0]}"
# echo "${gEXTs[2]}"
# echo "${gEXTs[3]}"
# echo "${gEXTs[8]}"
# echo "${gEXTs[9]}"
# echo "${gEXTs[-1]}"
# echo "${gEXTs[-2]}"
# history
# for gEXT in "${gEXTs[@]}"; do echo $gEXT; done
# for gEXT in "${gEXTs[@]}"; do echo $gEXT; gnome-extensions reset $gEXT; done
# for gEXT in "${gEXTs[@]}"; do echo $gEXT; gnome-extensions info $gEXT; done
# for gEXT in "${gEXTs[@]}"; do echo $gEXT; gnome-extensions enable $gEXT; done
# for gEXT in "${gEXTs[@]}"; do echo $gEXT; gnome-extensions info $gEXT; done

# gnome-extensions commands available
# enum
#   help      Print help
#   version   Print version
#   enable    Enable extension
#   disable   Disable extension
#   reset     Reset extension
#   uninstall Uninstall extension
#   list      List extensions
#   info      Show extension info
#   show      Show extension info
#   prefs     Open extension preferences
#   create    Create extension
#   pack      Package extension
#   install   Install extension bundle
# declare -a MENUOPTS=(
#                         [0]="help" [1]="version" [2]="enable" [3]="disable" [4]="reset" \
#                         [5]="uninstall" [6]="list" [7]="info" [8]="show" [9]="prefs" \
#                         [10]="create" [11]="pack" [12]="install" [13]="QUIT MENU"
#                     )

# gnome-extensions
function gnomeExtensionsAssistant() {
    #todo Implement a dynamic capture of gnome-extensions commands
    declare -a MENUOPTS=(
                        [0]="help" [1]="version" [2]="enable" [3]="disable" [4]="reset" \
                        [5]="uninstall" [6]="list" [7]="info" [8]="show" [9]="prefs" \
                        [10]="create" [11]="pack" [12]="install" [13]="QUIT"
                    )

    # user choice menu for simplicity
    select ACTION in "${MENUOPTS[@]}"; do
        case ${REPLY} in
            13) # user selected to quit
                printf "%02d:\t%s\n", "${ACTION}" "${REPLY}"
                echo 'exiting GNOME Extensions Assitant...'
                ;;
            1-12) # user selected valid command option
                echo 'selected option:' "${REPLY}"
                ;;
            *) # undetermined option
                echo 'unknown option:' "${REPLY}"
                echo 'Please choose from the following options:'
                for menuItem in "${!MENUOPTS[@]}"; do
                    printf "%s%d\n" "var is " "$menuItem"
                    printf "%d\:%s\n" "${menuItem}" "${MENUOPTS[$menuItem]}" 
                done
                ;;
        esac
    done
}