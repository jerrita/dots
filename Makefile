FILE_LISTS = mako tofi hypr waybar kitty *-flags.conf zshprof fontconfig

sync:
	cd ~/.config && rsync -r ${FILE_LISTS} ~/proj/dots
