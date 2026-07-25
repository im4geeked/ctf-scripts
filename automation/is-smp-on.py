# A simple niche script that notifies me if an Aternos server is on or not

# import important libraries
import time
import subprocess
from mcstatus import JavaServer

# variables
SERVER = "exampleserver.aternos.me" # CHANGE THIS
PORT = 11639 # CHANGE THIS
CHECK_INTERVAL = 15

# is the server even on
def is_online():
    try:
        server = JavaServer.lookup(f"{SERVER}:{PORT}")
        status = server.status()

        # only returns True if the server is up AND players are logged in
        if status.players.online > 0:
            return True
        return False # returns False if online but empty

    except Exception:
        return False

# notify me
def notify():
    subprocess.run([
        "notify-send",
        "Minecraft",
        "Server is online!"
    ])

# spam my desktop notifs
print(f"Monitoring {SERVER}:{PORT} for active players...")
while True:
    online = is_online()

    if online == True: 
        notify()
        print("Server just came online with players!")
    
    # check again after time interval (default is 15 seconds)
    time.sleep(CHECK_INTERVAL)

