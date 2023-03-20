# Guide

#### To use this script, save it to a file (e.g. script.sh) and make it executable with the command chmod +x script.sh. Then run the script with the command ./script.sh.

#### The script will prompt you for the list of hosts and ports, and the interval in seconds. The host and port lists should be comma-separated (e.g. example.com,google.com,yahoo.com), and the same number of hosts and ports should be specified. The script will then loop indefinitely, checking the status of each website every interval seconds. If a website is down, it will send a wall message with the specified content.