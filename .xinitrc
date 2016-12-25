
# some xterm stuff
# don't brother, use .Xdefaults instead
xrdb -merge ~/.Xresources

# Setup an icon tray
# trayer --edge bottom --align left --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

# set the background
# xsetroot -solid midnightblue

# for screen saver
xscreensaver -no-splash &

# some basic startup program
xterm tmux &
#xterm &
chromium &

# disable the annoying trackpad
trackpad

# start xbindkeys
#xbindkeys

#exec xfce4-session
exec xmonad

