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

the HSS database is exposing the port 8080 at the moment.