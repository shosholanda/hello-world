brillo() {
	if [ -z $1 ]; then
		echo "Uso: brillo <porcentaje>"
		return 1
	fi

	## Este valor puede ser que cambie con cada compu.
	## ver valores máximos en /sys/class/backlight/intel_backlight/max_brightness / 100
	brightness_value=$(($1 * 60))
	echo "$brightness_value" | sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
}


## Más alias
alias pila="acpi"
alias apagar="sudo shutdown -h now"
alias reiniciar="sudo reboot"
alias ll="ls -lah"
alias cdd="cd .."
