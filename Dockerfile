# Dockerfile for PostgreSQL and MediaWiki
# 	http://www.postgresql.org/
# 	http://www.mediawiki.org/wiki/MediaWiki

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

# Create the root user for the postgresql db


