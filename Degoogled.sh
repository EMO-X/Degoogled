#!/bin/bash

mapfile -t lines < save_to_remove_packages.txt

for line in "${lines[@]}"; do
	if adb shell pm list packages | grep "package:$line"; then
    		echo "Delete $line"
    		adb shell pm uninstall --user 0 "$line"
    		sleep 2
    	else
    		echo "Package not found $line"
    	fi
done
