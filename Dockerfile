FROM ubuntu:precise
MAINTAINER tuxtof <tuxtof@geo6.net>

ENV DEBIAN_FRONTEND noninteractive

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure tzdata
RUN echo "deb http://www.ubnt.com/downloads/unifi/debian unifi5 ubiquiti" > /etc/apt/sources.list.d/ubiquiti.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
RUN apt-get -q update && apt-get install -qy --force-yes unifi && apt-get -q clean && rm -rf /var/lib/apt/lists/*

EXPOSE 8080/tcp 8081/tcp 8443/tcp 8843/tcp 8880/tcp 3478/udp
VOLUME ["/var/lib/unifi"]
VOLUME ["/usr/lib/unifi/data"]
WORKDIR /var/lib/unifi

CMD java -Xms1024M -jar /usr/lib/unifi/lib/ace.jar start
