#!/bin/bash

# Prompt user for list of hosts and ports
read -p "Enter comma-separated list of hosts: " hosts
read -p "Enter comma-separated list of ports: " ports

# Convert comma-separated lists to arrays
IFS=',' read -ra host_list <<< "$hosts"
IFS=',' read -ra port_list <<< "$ports"

# Prompt user for interval in seconds
read -p "Enter interval in seconds: " interval

# Loop infinitely
while true; do
  # Loop through each host and port combination
  for i in "${!host_list[@]}"; do
    host=${host_list[$i]}
    port=${port_list[$i]}
    # Use nc command to check if website is up
    if nc -z -w 2 $host $port; then
      echo "$host:$port is up"
    else
      echo "$host:$port is down"
      # Send wall message if website is down
      echo "Your host $host has been down." | wall
    fi
  done
  # Sleep for specified interval
  sleep $interval
done
