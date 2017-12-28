FROM mysql:5.6
MAINTAINER Yan Grunenberger <yan@grunenberger.net>

ENV MYSQL_ROOT_PASSWORD=dbpassword

# reactivate DNS resolution in mysql
# https://github.com/docker-library/mysql/issues/154
RUN sed -i "s/skip-name-resolve/# skip-name-resolve/" /etc/mysql/conf.d/docker.cnf

# loading a backup.sql obtained via  kamdbctl create followed by mysqldump
ADD 1-kamailio.sql /docker-entrypoint-initdb.d/1-kamailio.sql
ADD 2-pcscf.sql /docker-entrypoint-initdb.d/2-pcscf.sql
ADD 3-scscf.sql /docker-entrypoint-initdb.d/3-scscf.sql
ADD 4-presence-create.sql /docker-entrypoint-initdb.d/4-presence-create.sql
ADD 5-icscf.mysql.sql /docker-entrypoint-initdb.d/5-icscf.mysql.sql