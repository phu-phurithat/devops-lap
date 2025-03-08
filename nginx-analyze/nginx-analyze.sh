#!/bin/bash
COUNTS=5

echo "Top ${COUNTS} most visited pages:"
awk '{print $1}' log-file.txt | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

echo "Top ${COUNTS} most requested paths"
awk '{print $6 $7}' log-file.txt | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

echo "Top ${COUNTS} response status codes"
grep -oE '[1-5][0-9]{2}' log-file.txt | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

echo "Top ${COUNTS} user agents"
awk -F'"' '{print $1}' log-file.txt | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}