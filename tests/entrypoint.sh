#!/bin/sh
set -e

# Install syslog-stdout

tar fxz /dist/syslog-stdout.tar.gz -C /usr/sbin

# Start syslog-stdout

/usr/sbin/syslog-stdout &
sleep 1

pkill -9 syslog-stdout

/usr/sbin/syslog-stdout &
sleep 1

# Test chmod

echo $(stat -c '%a' /dev/log)

# Test logs

logger "Test 1 syslog-stdout"
logger "Test 2 syslog-stdout"
sleep 1
