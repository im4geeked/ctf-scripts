# A script to show IPv4 addresses on a specific interface with one single command
interface="$1"
script_name=$(basename "$0")

if [ -z "$1" ]; then
    echo "Usage: $script_name <interface>"
    exit 1
fi

ip -4 addr show "$interface" | sed -n 's/ *inet \([0-9.]*\)\/.*$/\1/p'
