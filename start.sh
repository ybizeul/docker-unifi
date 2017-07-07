#!/bin/bash

function set_variable {
    CFG=/usr/lib/unifi/data/system.properties
    [ -e $CFG ] || touch $CFG
    VARIABLE=$1
    VALUE=$2

    sed -E -i "s/^#* *$VARIABLE *=.*/$VARIABLE=$VALUE/" $CFG
}

[ -z $UNIFI_HTTP_PORT ] || set_variable unifi.http.port $UNIFI_HTTP_PORT
[ -z $UNIFI_HTTPS_PORT ] || set_variable unifi.https.port $UNIFI_HTTPS_PORT
[ -z $PORTAL_HTTP_PORT ] || set_variable portal.http.port $PORTAL_HTTP_PORT
[ -z $PORTAL_HTTPS_PORT ] || set_variable portal.https.port $PORTAL_HTTPS_PORT
[ -z $UNIFI_STUN_PORT ] || set_variable unifi.stun.port $UNIFI_STUN_PORT

java -Xms1024M -jar /usr/lib/unifi/lib/ace.jar start