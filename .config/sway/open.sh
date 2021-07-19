#!/usr/bin/env bash

editor=vim

filemanager=ranger

term=kitty

path="$(fd --color never -j 4 --search-path=.config --search-path=Downloads --search-path=Documents --search-path=Dev --search-path=Pictures --search-path=Music | bemenu -n -i -I=1 -fn "SourceCodePro-Medium.otf" -p "Open" --tf=#dadee0 --hf=#dadee0 --nf=#6a7e95)"

[[ -d "$path" ]] && ($term -e $filemanager "$path" &) && exit

case "$(xdg-mime query filetype "$path")" in
        text/*) ($term -e $editor "$path" +"cd $(dirname "$path")"  &);;
        audio/*) cd ~/Music || exit
        mpc insert "${path#Music/}"
        (( $(mpc playlist | wc -l) > 1 )) && mpc next
        mpc play;;
        *) xdg-open "$path";;
        esac
