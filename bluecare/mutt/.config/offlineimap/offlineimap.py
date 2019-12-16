#!/usr/bin/env python3

import os

def read_credentials():
    home = os.environ['HOME']
    file = open(home + "/.accounts/bluecare/smbcredentials", "r")
    entries = []
    for line in file :
        entries += line.strip().split("=")
    file.close()
    return dict(zip(entries[::2], entries[1::2]))

def get_user():
    creds = read_credentials()
    return creds["domain"] + "\\" + creds["username"]

def get_pass():
    return read_credentials()["password"]

print(read_credentials())
print(get_user())

