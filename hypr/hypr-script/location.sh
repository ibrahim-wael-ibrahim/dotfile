#!/bin/bash

# Get the location information from ipinfo.io
location=$(curl -s https://ipinfo.io)

# Extract the required fields (city, region, country)
city=$(echo $location | jq -r '.city')
region=$(echo $location | jq -r '.region')
country=$(echo $location | jq -r '.country')

# Output the location
echo "$country  / $city"
