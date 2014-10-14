## Install from debian:squeeze, installs R 2.11.1, then gets the binares for 2.12
FROM debian:6.0

COPY sources.list /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get install -y --no-install-recommends r-base-core

RUN useradd docker


