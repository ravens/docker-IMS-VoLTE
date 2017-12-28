#!/bin/sh
#cd /usr/local/src/kamailio-4.3/kamailio
#sed -i s/'# DBENGINE=MYSQL'/'DBENGINE=MYSQL'/g utils/kamctl/kamctlrc
#sed -i s/'# DBHOST=localhost'/'DBHOST=db'/g utils/kamctl/kamctlrc
#sed -i s/'# DBNAME=kamailio'/'DBNAME=kamailio'/g utils/kamctl/kamctlrc
#sed -i s/'# DBRWUSER="kamailio"'/'DBRWUSER="kamailio"'/g utils/kamctl/kamctlrc
#sed -i s/'# DBRWPW="kamailiorw"'/'DBRWPW="kamailiorw"'/g utils/kamctl/kamctlrc
#sed -i s/'# DBROUSER="kamailioro"'/'DBROUSER="kamailioro"'/g utils/kamctl/kamctlrc
#sed -i s/'# DBROPW="kamailioro"'/'DBROPW="kamailioro"'/g utils/kamctl/kamctlrc
#sed -i s/'# SIP_DOMAIN=kamailio.org'/'SIP_DOMAIN=kamailio.org'/g utils/kamctl/kamctlrc
#sed -i s/'# DBACCESSHOST=192.168.0.1'/'DBACCESSHOST=dockervolte_kamailio_1.dockervolte_default'/g utils/kamctl/kamctlrc

# config file
#mkdir -p /usr/local/etc/kamailio/
#cp /usr/local/src/kamailio-4.3/kamailio/utils/kamctl/kamctlrc /usr/local/etc/kamailio/


# create database
#/usr/local/sbin/kamdbctl create

# daemonize
kamailio -f /usr/local/etc/kamailio/kamailio-scscf.cfg -D 
