#!/bin/bash

# Set your OpenWeatherMap API key here
API_KEY="41762b035ef8094ea8d4beaf3861376e"

# Get the location information (latitude and longitude)
location=$(curl -s https://ipinfo.io)
lat=$(echo $location | jq -r '.loc' | cut -d',' -f1)
lon=$(echo $location | jq -r '.loc' | cut -d',' -f2)

# Fetch the weather information from OpenWeatherMap
weather=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$API_KEY&units=metric")

# Extract the temperature and weather description
temp=$(echo $weather | jq -r '.main.temp')
description=$(echo $weather | jq -r '.weather[0].description')

# Output the weather information
echo " $temp°C"
# echo "Weather: $description"
