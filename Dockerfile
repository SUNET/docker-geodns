FROM ubuntu
MAINTAINER Leif Johansson <leifj@sunet.se>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -y update
RUN apt-get -y install python python-dev python-pip mercurial build-essential libgeoip-dev git-core pkgconf wget
RUN wget https://storage.googleapis.com/golang/go1.5.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.5.3.linux-amd64.tar.gz
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
