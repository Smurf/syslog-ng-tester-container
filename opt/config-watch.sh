#! /bin/sh

inotifywait -r -m /etc/syslog-ng/conf.d -e modify -e create -e moved_to --include '.*\.conf$'|
    while read file_path file_event file_name; do
        logger "${file_path} modified, restarting syslog-ng"
        echo "${file_path} modified, restarting syslog-ng" > /var/log/watcher
        kill -s HUP $(ps | grep syslog-ng | grep -v grep | tail -n 1 | awk '{print $1}')
    done
