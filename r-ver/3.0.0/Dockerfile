FROM debian:jessie 

ARG R_VERSION
ENV R_VERSION ${R_VERSION:-3-0-0}
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV TERM xterm

## dependencies
RUN apt-get update \ 
  && apt-get install -y --no-install-recommends \
    bash-completion \
     ## for https connections
    ca-certificates \
  ## keep for installing packages with compiled code, compression libs, linear algebra libs, graphics libs
    g++ \
    gfortran \
    make \
    libgfortran3 \ 
    libglib2.0-0 \
    libc6 \
    libreadline6 \ 
    ucf \
 ## linear algebra
    libblas3 \ 
    liblapack3 \
    libquadmath0 \
  ## Perl Regex
    libpcre3-dev \
    libpaper-utils \ 
  ## Compression 
    libbz2-dev \ 
    liblzma-dev \
    unzip \
    zlib1g \
    zip \
  ## Graphics (without dev libs)
    libcairo2 \ 
    libjpeg62-turbo \
    libpango-1.0-0 \ 
    libpangocairo-1.0-0 \ 
    libpng12-0 \
    libtiff5 \ 
  ## networking
    libcurl4-openssl-dev \
  ## for UTF-8 locale
    locales \
  ## Preferred graphics fonts
    gsfonts \
    fonts-texgyre \
  ## download utility
    wget \
  && rm -rf /var/lib/apt/lists/* \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.utf8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8 \
  && BUILDDEPS="bison \
    debhelper \
    default-jdk \
    file \
    groff-base \
    libblas-dev \
    libcairo2-dev \
    liblapack-dev \
    libjpeg-dev \
    libpng-dev \
    libreadline-dev \
    libtiff5-dev \
    libncurses5-dev \
    libpango1.0-dev \
    libx11-dev \
    libxt-dev \
    mpack \
    subversion \
    tcl8.6-dev \
    texinfo \
    texlive-extra-utils \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-latex-recommended \
    tk8.6-dev \
    x11proto-core-dev \
    xauth \
    xdg-utils \
    xfonts-base \
    xvfb \
    zlib1g-dev" \
  && apt-get update -qq \
  && apt-get install -y --no-install-recommends $BUILDDEPS \
  && cd /tmp \
  && svn co https://svn.r-project.org/R/tags/R-${R_VERSION}/ R-devel \ 
  && cd /tmp/R-devel \
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
    CFLAGS=$(R CMD config CFLAGS) \
    CXXFLAGS=$(R CMD config CXXFLAGS) \
  ./configure --enable-R-shlib \
               --without-blas \
               --without-lapack \
               --with-readline \
               --disable-nls \
               --without-x \
               --without-recommended-packages \
  && make \
  && make install \
  && echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /usr/local/lib/R/etc/Rprofile.site \
  && mkdir -p /usr/local/lib/R/site-library \
  && chown root:staff /usr/local/lib/R/site-library \
  && chmod g+wx /usr/local/lib/R/site-library \
  && echo "R_LIBS_USER='/usr/local/lib/R/site-library'" >> /usr/local/lib/R/etc/Renviron \
  && echo "R_LIBS=\${R_LIBS-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" >> /usr/local/lib/R/etc/Renviron \
  && rm -rf /tmp/R-devel \
  && apt-get remove --purge -y $BUILDDEPS \
  && apt-get autoremove -y \
  && apt-get autoclean -y \
  && rm -rf /var/lib/apt/lists/*

CMD ["R"]
