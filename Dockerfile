FROM ubuntu:22.04
MAINTAINER Leif Johansson <leifj@sunet.se>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -y update
RUN apt-get -y install python3 python3-dev python3-pip mercurial build-essential libgeoip-dev git-core pkgconf wget
RUN wget https://storage.googleapis.com/golang/go1.19.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
ENV GOPATH /opt/geodns
ENV DNSDIR /etc/geodns
ENV PATH /usr/local/go/bin:/usr/local/bin:/usr/bin:/bin
RUN go mod init local/build
RUN go clean -modcache 
RUN go get -d -u -v github.com/abh/geodns
RUN go build -o $GOPATH/bin/ github.com/abh/geodns
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
EXPOSE 53
EXPOSE 8053
VOLUME /etc/geodns
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/start.sh"]
