# base image is java v1.8
# unable to use java:8
# debian installs version 57.0.2987.98-1~deb8u1: amd64 i386
# https://packages.debian.org/search?suite=jessie&searchon=names&keywords=chromium
# version needed to run headless is 59 or later
# https://developers.google.com/web/updates/2017/04/headless-chrome
FROM openjdk:8

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update
# apt-get -y update required to install chromium
# E: Unable to locate package chromium
RUN apt-get -y install chromium
COPY /main/target/main-1.0-SNAPSHOT.jar /
COPY chromedriver /

ENTRYPOINT ["/usr/bin/java", "-jar", "/main-1.0-SNAPSHOT.jar"]
