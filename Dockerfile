FROM ubuntu:14.04
MAINTAINER tuxtof <tuxtof@geo6.net>

RUN echo "deb http://www.ubnt.com/downloads/unifi/distros/deb/ubuntu ubuntu ubiquiti" > /etc/apt/sources.list.d/ubiquiti.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
RUN apt-get -q update && apt-get install -qy --force-yes unifi-beta=4.6.3-4850 && apt-get -q clean

