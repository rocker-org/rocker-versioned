FROM debian:wheezy

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/rocker-org/rocker-versioned" \
      org.label-schema.vendor="Rocker Project" \
      maintainer="Carl Boettiger <cboettig@ropensci.org>" \
      contributor="Colin Fay <contact@colinfay.me>"

ARG R_VERSION
ARG BUILD_DATE
ENV BUILD_DATE ${BUILD_DATE:-2015-03-09}
ENV R_VERSION=${R_VERSION:-3.1.3} \
    LITTLER_VER=0.2.2 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    TERM=xterm 

## dependencies
## Update the sources.list to use wheezy archive
RUN rm /etc/apt/sources.list \
  && echo 'deb http://archive.debian.org/debian/ wheezy main non-free contrib' \
  >> /etc/apt/sources.list && \
  echo 'deb-src http://archive.debian.org/debian/ wheezy main non-free contrib' \
  >> /etc/apt/sources.list && \
  echo 'deb http://archive.debian.org/debian-security/ wheezy/updates main non-free contrib' \
  >> /etc/apt/sources.list && \
  echo 'deb-src http://archive.debian.org/debian-security/ wheezy/updates main non-free contrib' \
  >> /etc/apt/sources.list \
  && apt-get -o Acquire::Check-Valid-Until=false update \
  # From the 3.1.0 Dockerfile 
  && apt-get install -y --no-install-recommends \
    # for littler 
    autotools-dev \ 
    automake \ 
    bash-completion \
    build-essential \
    ca-certificates \
    curl \
    file \
    g++ \
    gfortran \
    gsfonts \
    libblas-dev \
    libbz2-1.0 \
    libcurl3 \
    libicu-dev \
    libjpeg-dev \
    libopenblas-dev \
    libcairo2-dev \
    libpcre3 \
    libpng-dev \
    libtiff5 \
    liblzma5 \
    locales \
    make \
    unzip \
    zip \
    zlib1g \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.utf8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8 \
  && BUILDDEPS="\
    default-jdk \
    libbz2-dev \
    libcurl4-openssl-dev \
    libpango1.0-dev \
    libpcre3-dev \
    libreadline-dev \
    libtiff5-dev \
    liblzma-dev \
    libx11-dev \
    libxt-dev \
    perl \
    tcl8.5-dev \
    tk8.5-dev \
    texinfo \
    texlive-extra-utils \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-recommended \
    x11proto-core-dev \
    xauth \
    xfonts-base \
    xvfb \
    zlib1g-dev" \
  && apt-get install -y --no-install-recommends $BUILDDEPS \
  && cd tmp/ \
  ## Download source code
  && curl -O https://cran.r-project.org/src/base/R-3/R-${R_VERSION}.tar.gz \
  ## Extract source code
  && tar -xf R-${R_VERSION}.tar.gz \
  && cd R-${R_VERSION} \
  ## Set compiler flags (adjusted from standard recipe for compatibility with gcc 4.7)
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
    CFLAGS="-g -O2  -Wformat -Werror=format-security  -D_FORTIFY_SOURCE=2 -g" \
    CXXFLAGS="-g -O2 -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -g" \
  ## Configure options
  ./configure --enable-R-shlib \
               --enable-memory-profiling \
               --with-readline \
               --with-blas \
               --with-tcltk \
               --disable-nls \
               --with-recommended-packages \
  ## Build and install
  && make \
  && make install \
  ## Add a default CRAN mirror
  && echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'curl')" >> /usr/local/lib/R/etc/Rprofile.site \
  ## Add a library directory (for user-installed packages)
  && mkdir -p /usr/local/lib/R/site-library \
  && chown root:staff /usr/local/lib/R/site-library \
  && chmod g+wx /usr/local/lib/R/site-library \
  ## Fix library path
  && echo "R_LIBS_USER='/usr/local/lib/R/site-library'" >> /usr/local/lib/R/etc/Renviron \
  && echo "R_LIBS=\${R_LIBS-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" >> /usr/local/lib/R/etc/Renviron \
  ## install packages from date-locked MRAN snapshot of CRAN
  && [ -z "$BUILD_DATE" ] && BUILD_DATE=$(TZ="America/Los_Angeles" date -I) || true \
  && MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'curl')" >> /usr/local/lib/R/etc/Rprofile.site \
  ## Add a library directory (for user-installed packages)
  && mkdir -p /usr/local/lib/R/site-library \
  && chown root:staff /usr/local/lib/R/site-library \
  && chmod g+wx /usr/local/lib/R/site-library \
  ## Fix library path
  && echo "R_LIBS_USER='/usr/local/lib/R/site-library'" >> /usr/local/lib/R/etc/Renviron \
  && echo "R_LIBS=\${R_LIBS-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" >> /usr/local/lib/R/etc/Renviron \
  ## install packages from date-locked MRAN snapshot of CRAN
  && [ -z "$BUILD_DATE" ] && BUILD_DATE=$(TZ="America/Los_Angeles" date -I) || true \
  && MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'curl')" >> /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "install.packages(c('docopt'), repo = '$MRAN')" \
  ## make test 
  && make install-tests \
  && cd $(R RHOME) \
  && cd tests \
  && ../bin/R CMD make check \
  && R -e 'tools::testInstalledBasic("both")' \
  ## Install littler from tarball \
  && curl -O http://dirk.eddelbuettel.com/code/littler/littler-${LITTLER_VER}.tar.gz \
  && tar -zxvf littler-${LITTLER_VER}.tar.gz \
  && cd littler-${LITTLER_VER} \
  && ./bootstrap \
  && make \
  && make install \
  ## Clean up from R source install
  && cd / \
  && rm -rf /tmp/* \
  && apt-get remove --purge -y $BUILDDEPS \
  && apt-get autoremove -y \
  && apt-get autoclean -y \
  && rm -rf /var/lib/apt/lists/*

CMD ["R"]

