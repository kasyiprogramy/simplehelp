FROM ubuntu:18.04

EXPOSE 80 443

ADD script/ /home/

WORKDIR /opt

RUN apt-get update && apt-get install -y wget openjdk-11-jdk libc6-i386 && apt-get purge && rm -rf /var/lib/apt/lists/* && apt-get clean
RUN wget -O- http://simple-help.com/releases/SimpleHelp-linux-amd64.tar.gz | tar -xzv 

WORKDIR /opt/SimpleHelp

RUN sed -i 's/&//g' serverstart.sh


CMD ["sh", "serverstart.sh"]
