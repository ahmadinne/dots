#!/bin/bash
while true; do
	total=$(mpstat --dec=0 1 1 | awk '{print (100 - $12)}' | tail -n1)
	echo $total > /tmp/cpu-usage.txt
done
