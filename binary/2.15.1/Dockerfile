## debian wheezy - debian snapshot 20130310 ~ 2.15.1-4
FROM debian:wheezy

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo \
	deb http://snapshot.debian.org/archive/debian/20130310 wheezy main \
	 >> /etc/apt/sources.list && echo \
	deb http://snapshot.debian.org/archive/debian-security/20130310 wheezy/updates main \
	>> /etc/apt/sources.list && \
	apt-get -o Acquire::Check-Valid-Until=false update

RUN apt-get install -y --no-install-recommends \
	ed \
	less \
	r-base \
	r-recommended \
	vim-tiny \
	wget \
	nano


## Set a default user. Available via runtime flag `--user docker`
## and add user to 'staff' group, granting them write privileges
## to /usr/local/lib/R/site.library
RUN useradd docker
# no addgroup in wheezy
#RUN addgroup docker staff


