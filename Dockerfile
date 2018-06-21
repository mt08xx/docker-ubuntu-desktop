FROM resin/rpi-raspbian:stretch

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

#RUN  echo 'Acquire::http::Proxy "http://apt-cache-server:3142";' > /etc/apt/apt.conf.d/02proxy

RUN apt-get update && \
    apt-get install -y --no-install-recommends lxde && \
    apt-get install -y tightvncserver && \
    mkdir /root/.vnc

ADD xstartup /root/.vnc/xstartup
ADD passwd /root/.vnc/passwd

RUN chmod 600 /root/.vnc/passwd

CMD /usr/bin/vncserver :1 -geometry 1280x800 -depth 24 && tail -f /root/.vnc/*:1.log

EXPOSE 5901
