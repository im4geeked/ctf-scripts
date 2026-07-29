#!/usr/bin/bash
# folder that you want to scan (given with args)

# helptext func
function helptext {
    echo "[-] Usage: $0 <destination_directory>"
    echo "[-] Failed"
}     

# conditional for when no arguements are passed

if [ -z "$1" ]; then
    helptext
    exit 1
fi

# variables
dir=$1

# the actual commands
echo "[+] Updating databases..."
sudo freshclam
echo "[+] Scanning the directory specified..."
sudo clamscan --recursive "$dir"
echo "[+] Done "
