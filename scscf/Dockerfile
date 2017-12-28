FROM debian:8
MAINTAINER Yan Grunenberger <yan@grunenberger.net>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -yq dist-upgrade 
RUN apt-get -yq install git-core
RUN apt-get -yq install gcc
RUN apt-get -yq install flex
RUN apt-get -yq install bison
RUN apt-get -yq install libmysqlclient-dev
RUN apt-get -yq install make
RUN apt-get -yq install libssl-dev
RUN apt-get -yq install libcurl4-openssl-dev
RUN apt-get -yq install libxml2-dev
RUN apt-get -yq install libpcre3-dev
RUN mkdir -p /usr/local/src/kamailio-4.3
WORKDIR /usr/local/src/kamailio-4.3
RUN git clone --depth 1 --no-single-branch git://git.kamailio.org/kamailio kamailio
WORKDIR /usr/local/src/kamailio-4.3/kamailio
RUN git checkout -b 4.3 origin/4.3
#RUN make include_modules="db_mysql ims_usrloc_pcscf ims_registrar_pcscf" cfg
RUN make include_modules="db_mysql presence ims_usrloc_pcscf ims_registrar_pcscf ims_auth ims_charging ims_icscf ims_isc ims_qos ims_registrar_pcscf ims_registrar_scscf ims_usrloc_pcscf ims_usrloc_scscf dialog_ng cdp cdp_avp" cfg
RUN make all
RUN make install
RUN apt-get -qy install mysql-client
ENTRYPOINT ["/usr/local/sbin/kamailio","-f","/usr/local/etc/kamailio/kamailio-scscf.cfg","-D"]