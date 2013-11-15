# Dockerfile for PostgreSQL
# 	http://www.postgresql.org/
#	http://www.postgresql.org/docs/9.1/static/app-createuser.html
# 	http://zaiste.net/2013/08/docker_postgresql_how_to/

FROM ubuntu
MAINTAINER Shaba Abhiram <shabarivas@gmail.com>

# Common header for all Dockerfiles
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

#
# POSTGRESQL INSTALL
#

# Install python-software-properties 
# 	http://packages.ubuntu.com/lucid/python-software-properties
RUN apt-get -y install python-software-properties
RUN apt-get -y install software-properties-common

# Install PostgreSQL - See notes for Ubuntu PPA 
#	http://www.postgresql.org/download/linux/ubuntu/
RUN add-apt-repository ppa:pitti/postgresql
RUN apt-get update
RUN apt-get -y install postgresql-9.2 postgresql-contrib-9.2 postgresql-client-9.2

# Install sudo
RUN apt-get -y install sudo

# Create the root user for the postgresql db
RUN sudo -u postgres createuser -d -r -s root

# Create a db named wiki_db
RUN sudo -u postgres createdb -O root wiki_db

# Edit some files...
RUN echo host	all		all		0.0.0.0/0		md5 >> /etc/postgresql/9.2/main/pg_hba.conf
RUN echo listen_address='*' >> /etc/postgresql/9.2/main/postgresql.conf

EXPOSE 5432
CMD ["/bin/su", "postgres", "-c", "'/usr/lib/postgresql/9.2/bin/postgres -D /var/lib/postgresql/9.2/main -c config_file=/etc/postgresql/9.2/main/postgresql.conf'"]
