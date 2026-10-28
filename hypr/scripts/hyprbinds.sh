#!/bin/bash
mainkey=$(
  grep "local" ~/.config/hypr/controls.lua | 
  sed -n 's/local mainMod[^"]*"\([^"]*\).*/\1/p'
) && 
secondkey=$(
  grep "local" ~/.config/hypr/controls.lua | 
  sed 's/mainMod .. "/"'"$mainkey"'/' |
  sed -n 's/local secondMod[^"]*"\([^"]*\).*/\1/p'
) &&
grep "hl.bind" ~/.config/hypr/controls.lua | 
  sed 's/mainMod .. "/"'"$mainkey"'/' | 
  sed 's/secondMod .. "/"'"$secondkey"'/' | 
  sed 's/" .. key\[i\]/\[0-9\]"/' |
  sed 's/[^"]*"\([^"]*\).*description *= *"\([^"]*\).*/\1 = \2/' |
  rofi -dmenu -theme /home/tamary/.local/share/rofi/themes/rounded-nord-dark.rasi -i 
