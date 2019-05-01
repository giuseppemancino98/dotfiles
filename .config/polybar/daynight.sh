#!/bin/bash
#night=0
#day=1

switch_mode(){
	case $status in
	0)
	wal -q  -i "$(< ~/.cache/wal/wal)"
/bin/cp ~/.config/gtk-3.0/settingsNight.ini ~/.config/gtk-3.0/settings.ini
	;;
	1)
	wal -q -l -i "$(< ~/.cache/wal/wal)"
/bin/cp ~/.config/gtk-3.0/settingsDay.ini ~/.config/gtk-3.0/settings.ini
	;;
	esac
}

print_mode(){
	case $status in
	0)
	echo ""
	;;
	1)
	echo ""	
	;;
	esac
}

status=$(cat ~/.config/polybar/laststatus)

if [ $1 = "--change" ]; then 
	status=$((1-status))
	switch_mode
fi
print_mode
> laststatus
echo "$status" > ~/.config/polybar/laststatus
