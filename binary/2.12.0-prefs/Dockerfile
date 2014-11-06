## Install from debian:squeeze, installs R 2.11.1, then gets the binaries for 2.12
FROM debian:wheezy

### SNAPSHOTTING: create a new source + preferences for r-* deb pkgs
RUN echo \
  'deb http://snapshot.debian.org/archive/debian/20101017/ sid  main' > /etc/apt/sources.list.d/snapshot.list \
  && printf "Package: r-*\nPin: origin snapshot.debian.org\nPin-Priority: 990\n" > /etc/apt/preferences.d/snapshot \
  &&  apt-get -o Acquire::Check-Valid-Until=false update

RUN apt-get install -y --no-install-recommends  --allow-unauthenticated r-base-dev

RUN useradd -g staff -m docker



