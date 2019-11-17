#!/run/current-system/sw/bin/bash

/run/current-system/sw/bin/cat ~/.smbcredentials/bluecare | /run/current-system/sw/bin/grep password | /run/current-system/sw/bin/cut -d "=" -f 2

