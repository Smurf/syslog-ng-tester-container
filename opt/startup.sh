#! /bin/sh

_term (){
    logger "Container SIGTERM caught. Cleaning up"
    kill -TERM $syslog_pid
    kill -TERM $watcher_pid
    kill -TERM $spewer_pid
}

trap _term SIGTERM

rm -f /var/log/messages
rm -f /var/log/spew
rm -f /var/log/watcher
syslog-ng &
syslog_pid=$!

/opt/log-spewer.sh &
spewer_pid=$!

/opt/config-watch.sh &
watcher_pid=$!

wait "$watcher_pid"
