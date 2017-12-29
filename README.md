# docker-IMS-VoLTE
Docker-based IMS services for enabling VoLTE support. 

## status

Heavy Work in progress. So far :
* Basic docker for Kamailo 
* Basic dockers for P-CSCF, S-CSCF and I-CSCF
* Basic docker for HSS

Todo: 
* check connectivity between HSS and P/I/S-CSCF function (HSS is not connecting properly)
* test against EPC

Original IMS in the box configuration is detailed at https://www.kamailio.org/w/2016/02/kamailio-ims-getting-started-box/

## setup 

First we need to populate the support database for all components:
```
docker-compose up -d db
```

in db/data the database should be prepopulated.

then to run :

```
docker-compose up -d
```

All containers are exposing their respective ports (SIP derivatives for P/I/S-CSCF and Diameter for HSS). The administrative interface is on port 8080, with hssAdmin/hss as admin and hss/hss as user.

HSS parameters need to be setup in the fhoss/config/hss.properties files (OP key, AMF)
