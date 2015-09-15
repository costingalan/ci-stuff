# mac-ping V1

This scripts checks connectivity on a network card and creates a logfile with the results.

**Requires:** The machine that you want to test connectivity must run **mactelnetd**: http://manpages.ubuntu.com/manpages/precise/man1/mactelnetd.1.html

**Usage:** ./mac_ping.sh MAC_ADDRESS


# mac-ping V2

This scripts reads from a file the hosts and macs. The line format in the file is : $HOST|$MAC. For every host and mac address, it creates a log file every day.

**Requires:** The machine that you want to test connectivity must run **mactelnetd**: http://manpages.ubuntu.com/manpages/precise/man1/mactelnetd.1.html

**Usage:** ./mac_ping.sh

