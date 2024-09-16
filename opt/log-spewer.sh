#! /bin/sh

LOG_DELAY="${LOG_DELAY:-1}"
LOG_FEED="${LOG_FEED:-/opt/log_feed}"
echo $LOG_FEED
echo $LOG_DELAY
while true;
do
    while IFS='' read -r line;
    do
        echo "$line"
        echo "$line" >> /var/log/spew
        sleep $LOG_DELAY
    done < $LOG_FEED
done
