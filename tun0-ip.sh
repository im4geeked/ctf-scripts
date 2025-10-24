# A quick way to find out the IP for your tun0 interface 
# Useful if you're playing machines on platforms like HackTheBox and TryHackMe. 

ip -4 addr show tun0 | sed -n 's/ *inet \([0-9.]*\)\/.*$/\1/p'
