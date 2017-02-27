#!/usr/bin/bash

# Define the clock
Clock() {
        DATETIME=$(date "+%a %b %d, %T")

        echo -n "$DATETIME"
}

#Define the battery
Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        echo "$BATPERC"
}

while true; do
        #echo "%{r}$(Battery)"
        echo "%{c}%{F#FFFF00}%{B#FF00FF} $(Clock) %{r}$(Battery)"
        sleep 1
done
