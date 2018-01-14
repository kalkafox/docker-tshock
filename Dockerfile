FROM mono:latest
MAINTAINER Kalka <k@kalka.io>

RUN apt-get update && \
    apt-get install unzip && \
    apt-get clean

RUN curl -sL https://github.com/NyxStudios/TShock/releases/download/v4.3.25/tshock_4.3.25.zip > /tmp/tshock.zip && \
    unzip /tmp/tshock.zip -d /opt/tshock && \
    rm /tmp/tshock.zip

COPY plugins/ /opt/tshock/ServerPlugins/

EXPOSE 7777

VOLUME /opt/tshock/tshock
VOLUME /opt/tshock/world

WORKDIR /opt/tshock

ENTRYPOINT ["mono", "--server", "--gc=sgen", "-O=all", "TerrariaServer.exe", "-worldpath", "/opt/tshock/world"]
