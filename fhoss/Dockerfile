FROM debian:8
MAINTAINER Yan Grunenberger <yan@grunenberger.net>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -yq dist-upgrade 
RUN apt-get -qy install openjdk-7-jdk
RUN apt-get -qy install ant
RUN apt-get -qy install subversion
RUN mkdir -p /opt/OpenIMSCore
WORKDIR /opt/OpenIMSCore
RUN svn checkout svn://svn.code.sf.net/p/openimscore/code/FHoSS/trunk FHoSS
WORKDIR /opt/OpenIMSCore/FHoSS
RUN JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 ant compile deploy 
