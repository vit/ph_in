FROM ubuntu:trusty

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get -y install supervisor postfix

ADD install.sh /opt/install.sh

CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf


