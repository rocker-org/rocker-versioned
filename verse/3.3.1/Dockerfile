FROM rocker/tidyverse:3.3.1

## Add LaTeX, rticles and bookdown support
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ## for rJava
    default-jdk \
    ## used by some base R plots
    ghostscript \
    ## used to build rJava and other packages
    libbz2-dev \
    libicu-dev \
    liblzma-dev \
    ## system dependency of hunspell (devtools)
    libhunspell-dev \
    ## system dependency of hadley/pkgdown
    libmagick++-dev \
    ## for V8-based javascript wrappers
    libv8-dev \
    ## R CMD Check wants qpdf to check pdf sizes, or throws a Warning 
    qpdf \
    ## for git via ssh key 
    ssh \
    ## for building pdfs via pandoc/LaTeX
    lmodern \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-humanities \
    texlive-latex-extra \
    texlive-science \
    texinfo \
    ## just because
    less \
    vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && cd /usr/share/texlive/texmf-dist/tex/latex \
  ## additional tex files needed for certain rticles templates
  && wget http://mirrors.ctan.org/macros/latex/contrib/ametsoc.zip \
  && unzip ametsoc.zip \
  && rm *.zip \
## R manuals use inconsolata font, but texlive-fonts-extra is huge, so:
  && cd /usr/share/texlive/texmf-dist \
  && wget http://mirrors.ctan.org/install/fonts/inconsolata.tds.zip \
  && unzip inconsolata.tds.zip \
  && rm *.zip \
  && echo "Map zi4.map" >> /usr/share/texlive/texmf-dist/web2c/updmap.cfg \
  && mktexlsr \
  && updmap-sys \
  ## And some nice R packages for publishing-related stuff 
  && . /etc/environment \ 
  && install2.r --error --repos $MRAN --deps TRUE \
    bookdown rticles rmdshower

## Consider including: 
# - libv8-dev (Javascript V8 packages)
# - yihui/printr R package (when released to CRAN)
# - jags 4.2 (build from source, repo version too old and apt-tagging forces upgrade of all compiler libs)
# - libgsl0-dev (GSL math library dependencies)
# - librdf ?
