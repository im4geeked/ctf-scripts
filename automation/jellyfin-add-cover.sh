# Since most of the music I listen to on Jellyfin is from underground artists, I have to download the covers manually and do all of this so I want to automate it

# variable for PATH for album cover 
path=$1 
cover=$2 

# function to rename and move the file 
function conv_and_mv {
    if [[ -f "$cover" ]]; then 
        echo "[+] Converting and moving the cover to specified path..."
        convert "$cover" cover.jpg 
        mv cover.jpg "$path"
        echo "[+] Done."
    
    else
        echo "[-] Specified image not found"
        echo "[-] Please provide a valid image"
        exit 1
    fi

}


# helptext func
function helptext {
    echo "[-] Usage: $0 <destination_directory> <source_image>"
    echo "[-] Example: $0 ~/Music images.jpg"
    echo "[-] Failed"
}    

# conditional for when no variables are passed

if [[ -z "$path" || -z "$cover" ]]; then
    helptext
    exit 1
fi

conv_and_mv 
