FROM alpine:3.20.3

RUN \
    apk add -U --upgrade --no-cache \
    logger \
    inotify-tools \
    grep \
    libdbi-drivers \
    paho-mqtt-c \
    syslog-ng \
    syslog-ng-add-contextual-data \
    syslog-ng-amqp \
    syslog-ng-graphite \
    syslog-ng-http \
    syslog-ng-json \
    syslog-ng-map-value-pairs \
    syslog-ng-python \
    syslog-ng-redis \
    syslog-ng-scl \
    syslog-ng-sql \
    syslog-ng-stardate \
    syslog-ng-stomp \
    syslog-ng-tags-parser \
    syslog-ng-xml

ENTRYPOINT /opt/startup.sh
