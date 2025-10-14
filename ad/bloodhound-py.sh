#!/bin/bash 

# ahhhh too much params
# bloodhound-python -d <domain> -u <username> -p <password> -gc <domain> -c All -ns <ip of the domain> 

echo 'Domain (e.g tombwatcher.htb): '
read domain 

echo 'Username: '
read username

echo 'Password: '
read password

echo 'IP of Domain: ' 
read ip_address

bloodhound-python -d $domain -u $username -p $password -gc $domain -c all -ns $ip_address
