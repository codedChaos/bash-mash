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

function gnomeExtensionsAssistant() {
    
}