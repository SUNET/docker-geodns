FROM ubuntu:18.04
MAINTAINER Leif Johansson <leifj@sunet.se>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN /bin/sed -i s/archive.ubuntu.com/se.archive.ubuntu.com/g /etc/apt/sources.list
RUN apt-get -y update && \
	apt-get -y install python python-dev python-pip mercurial build-essential libgeoip-dev git-core pkgconf golang-go && \
	apt-get clean
ENV GOPATH /opt/geodns
ENV DNSDIR /etc/geodns
ENV PATH /usr/local/go/bin:/usr/local/bin:/usr/bin:/bin
RUN go get -u -v github.com/abh/geodns
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
EXPOSE 53
EXPOSE 8053
VOLUME /etc/geodns
ENTRYPOINT ["/start.sh"]
