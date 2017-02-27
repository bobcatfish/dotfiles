#!/usr/bin/bash

Clock() {
    DATETIME=$(date "+%a %b %d, %T")
    echo -n "$DATETIME"
}

Battery() {
    BATPERC=$(acpi --battery | cut -d, -f2)
    echo "$BATPERC"
}

CPU() {
    CPUUSAGE=$(ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}')
    echo "$CPUUSAGE"
}

RAM() {
    # store the total and free memory in two variables
    read t <<< `grep -E 'MemTotal' /proc/meminfo |awk '{print $2}'`
    read a <<< `grep -E 'MemAvailable' /proc/meminfo |awk '{print $2}'`

    # then, calcultate the percentage of memory used
    RAMUSAGE=$(bc <<< "scale=2; 100 * (($t-$a) / $t)")
    echo "$RAMUSAGE"
}


while true; do
    echo "%{l}CPU: $(CPU)% Memory: $(RAM)%  %{c}%{F#FFFF00}%{B#FF00FF} $(Clock) %{r}Battery:$(Battery)"
    sleep 1
done
