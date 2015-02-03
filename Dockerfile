FROM ubuntu
MAINTAINER Leif Johansson <leifj@sunet.se>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -y update
RUN apt-get -y install python python-dev python-pip golang mercurial build-essential libgeoip-dev git-core
ENV GOPATH /opt/geodns
ENV DNSDIR /etc/geodns
RUN go get -u -v github.com/leifj/geodns
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
EXPOSE 53
EXPOSE 8053
VOLUME /etc/geodns
ENTRYPOINT "/start.sh"
