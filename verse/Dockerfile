FROM rocker/tidyverse:3.4.2

## Add LaTeX, rticles and bookdown support
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ## for rJava
    default-jdk \
    ## Nice Google fonts
    fonts-roboto \    
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
    ## rdf, for redland / linked data
    librdf0-dev \
    ## for V8-based javascript wrappers
    libv8-dev \
    ## R CMD Check wants qpdf to check pdf sizes, or throws a Warning 
    qpdf \
    ## for git via ssh key 
    ssh \
    ## for building pdfs via pandoc/LaTeX (These are large!)
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
  ## Currently (2017-06-06) need devel PKI for ssl issue: https://github.com/s-u/PKI/issues/19
  && install2.r -r http://rforge.net PKI \
  ## And some nice R packages for publishing-related stuff
  && install2.r --error --deps TRUE \
    bookdown rticles rmdshower

## Consider including: 
# - yihui/printr R package (when released to CRAN)
# - libgsl0-dev (GSL math library dependencies)
# - librdf0-dev
