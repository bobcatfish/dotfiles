sxhkd &
xset b off
amixer sset Master unmute
sudo systemctl start connman
~/lemonbar.sh | lemonbar -p &

exec bspwm
