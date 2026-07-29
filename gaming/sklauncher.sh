#!/usr/bin/bash 

JAR_FILE=$(ls /home/$USER/Downloads/SK*.jar | head -n 1) # change this if you want 


if [[ -f "$JAR_FILE" ]]; then
	echo "[+] JAR file found..."
	# DRI_PRIME=1 is just an environment variable to force a command to force my AMD GPU because it doesn't get used by default :(
	DRI_PRIME=1 java -jar "$JAR_FILE" 
else
	echo "[-] Not found. "
	echo "[-] Failed"
	exit 1
fi

