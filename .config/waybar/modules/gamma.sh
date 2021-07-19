#!/usr/bin/env bash

maxTemp=6500
currentTemp=$(cat "$HOME/.cache/gamma")
delta=$(( maxTemp - currentTemp ))
percent=$(( delta * 100 / maxTemp ))
printf '%s\n' $percent
