#!/bin/bash

LOG_FILE="./apache_logs"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file not found."
    exit 1
fi

TOTAL_REQUESTS=$(wc -l < "$LOG_FILE")

ERROR_404=$(grep "404" "$LOG_FILE" | wc -l)

MOST_REQUESTED=$(awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5)


MOST_ACTIVE_IPS=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5)

echo "==================="
echo "Web Server Log Analysis"
echo "==================="
echo "Total requests: $TOTAL_REQUESTS"
echo "404 errors: $ERROR_404"
echo "Top 5 IP addresses with most requests:"
echo "$MOST_ACTIVE_IPS"


