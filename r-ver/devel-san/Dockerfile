FROM debian:stretch

## From the Build-Depends of the Debian R package, plus subversion
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    ed \
    less \
    locales \
    vim-tiny \
    wget \
    ca-certificates \
    fonts-texgyre \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.utf8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    bash-completion \
    bison \
    debhelper \
    default-jdk \
    g++ \
    gcc \
    gfortran \
    groff-base \
    libblas-dev \
    libbz2-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libjpeg-dev \
    liblapack-dev \
    liblzma-dev \
    libncurses5-dev \
    libpango1.0-dev \
    libpcre3-dev \
    libpng-dev \
    libreadline-dev \
    libtiff5-dev \
    libx11-dev \
    libxt-dev \
    mpack \
    subversion \
    tcl8.6-dev \
    texinfo \
    texlive-base \
    texlive-extra-utils \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended \
    tk8.6-dev \
    valgrind \
    x11proto-core-dev \
    xauth \
    xdg-utils \
    xfonts-base \
    xvfb \
    zlib1g-dev

## Check out R-devel
RUN cd /tmp \
  && svn co https://svn.r-project.org/R/trunk R-devel 

## Build and install according the standard 'recipe' I emailed/posted years ago
## Updated compiler flags to match https://www.stats.ox.ac.uk/pub/bdr/memtests/README.txt
RUN cd /tmp/R-devel \
  && R_PAPERSIZE=letter \
     R_BATCHSAVE="--no-save --no-restore" \
     R_BROWSER=xdg-open \
     PAGER=/usr/bin/pager \
     PERL=/usr/bin/perl \
     R_UNZIPCMD=/usr/bin/unzip \
     R_ZIPCMD=/usr/bin/zip \
     R_PRINTCMD=/usr/bin/lpr \
     LIBnn=lib \
     AWK=/usr/bin/awk \
     CFLAGS="-pipe -Wall -pedantic -O2 -mtune=native -fsanitize=address" \
     FFLAGS="-pipe -O2 -mtune=native" \
     FCFLAGS="-pipe -O2 -mtune=native" \
     CXXFLAGS="-pipe -Wall -pedantic -O2 -mtune=native" \
           MAIN_LDFLAGS="-fsanitize=address,undefined" \
           CC="gcc -std=gnu99 -fsanitize=address,undefined -fno-omit-frame-pointer" \
     CXX="g++ -fsanitize=address,undefined,bounds-strict -fno-omit-frame-pointer -fno-sanitize=object-size,vptr" \
           CXX1X="g++ -fsanitize=address,undefined,bounds-strict -fno-omit-frame-pointer -fno-sanitize=object-size,vptr" \
     FC="gfortran" \
     F77="gfortran" \
     ./configure --enable-R-shlib \
               --without-blas \
               --without-lapack \
               --with-readline \
               --without-recommended-packages \
               --program-suffix=dev \
               --disable-openmp \
  && make \
  && make install \
  && make clean

## Set Renviron to get libs from base R install
RUN echo "R_LIBS=\${R_LIBS-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" >> /usr/local/lib/R/etc/Renviron

## Set default CRAN repo
RUN echo 'options("repos"="http://cloud.r-project.org")' >> /usr/local/lib/R/etc/Rprofile.site

## More verbose UBSAN/SAN output (cf #3) -- this is still somewhat speculative
## Entry copied from Prof Ripley's setup described at http://www.stats.ox.ac.uk/pub/bdr/memtests/README.txt
ENV ASAN_OPTIONS 'alloc_dealloc_mismatch=0:detect_leaks=0:detect_odr_violation=0' 


RUN R -e "install.packages(c('docopt', 'littler'))"
