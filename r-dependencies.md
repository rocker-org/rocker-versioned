
From debian:jessie

    apt-cache show r-base-core | grep ^Depends     
    apt-cache showsrc r-base-core | grep ^Build-Depends


## Depends ##

Debian package |              Included in r-ver?              | Category
-------------- | -------------------------------------------- | -------------
zip |                          added |                          compression
unzip |                        added |                          compression
libpaper-utils |             
xdg-utils |                    not added |                      X11 / desktop integration                  
libblas3 / libblas.so.3 |      provided by libopenblas |        math
libbz2-1.0 |                   already on debian:jessie |       compression
libc6 |                        already on debian:jessie |       core-libs
libcairo2 |                    added |                          graphics
libgfortran3 |                 provided by gfortran |           compiler
libglib2.0-0 |                 already on debian:jessie |       core-libs
libgomp1 |                     provided by gcc |                compiler (openmp threading support)
libice6 |                      not added |                      X11
libjpeg62-turbo |              added |                          graphics
liblapack3 / liblapack.so.3 |  provided by libopenblas |        math 
liblzma5 |                     already on debian:jessie |       compression
libpango-1.0-0 |               replaced by libpangocairo |      graphics
libpangocairo-1.0-0 |          added |                          graphics
libpcre3 |                     already on debian:jessie |       regex
libpng12-0 |                   added |                          graphics
libquadmath0 |                 provided by gcc |                compiler
libreadline6 |                 already on debian:jessie |       readline
libsm6 |                       not added |                      X11
libtcl8.5 |                    not added |                      tcl/tk
libtiff5 |                     added |                          graphics
libtk8.5 |                     not added |                      tcl/tk
libx11-6 |                     not added |                      X11
libxext6 |                     not added |                      X11
libxss1 |                      not added |                      X11
libxt6 |                       not added |                      X11
zlib1g |                       already on debian:jessie |       compression
ucf |                          pulled in by ? |                 config files



## Build-Depends ##

Debian package |              Included in r-ver?              | Category
-------------- | -------------------------------------------- | -------------
gcc |                          included in deps (via g++) |       compiler
g++ |                          included in deps |                 compiler
gfortran |                     included in deps |                 compiler
libblas-dev |                  included in deps |                 math
liblapack-dev |                included in deps |                 math 
tcl8.5-dev |                   not added |                        TCL/TK
tk8.5-dev |                    not added |                        TCL/TK
bison |                        not added |                    
groff-base |                   not added | 
libncurses5-dev |              not added |                         
libreadline-dev |              added as build-dep |               readline
debhelper |                    not added |                        debian
texinfo |                      added as build-dep |               tex
libbz2-dev |                   added as build-dep |               compression
liblzma-dev |                  added as build-dep |               compression
libpcre3-dev |                 added as build-dep |               regex
xdg-utils |                    not added |                        X11
zlib1g-dev |                   added as build-dep |               compression
libpng-dev |                   added as build-dep |               graphics
libjpeg-dev |                  added as build-dep |               graphics
libx11-dev |                   not added |                        X11
libxt-dev |                    not added |                        X11 
x11proto-core-dev |            not added |                        X11
libpango1.0-dev |              added as build-dep |               graphics
libcairo2-dev |                added as build-dep |               graphics
libtiff5-dev |                 added as build-dep |               graphics
xvfb |                         not added |                        X11 
xauth |                        not added |                        X11 
xfonts-base |                  not added |                        X11 
texlive-base |                 added as build dep |               tex
texlive-latex-base |           added as build dep |               tex
texlive-generic-recommended |  added as build dep |               tex
texlive-fonts-recommended |    added as build dep |               tex
texlive-fonts-extra |          added as build dep |               tex
texlive-extra-utils |          added as build dep |               tex
texlive-latex-recommended |    added as build dep |               tex
texlive-latex-extra |          added as build dep |               tex
default-jdk |                  added as build dep |               java
mpack |
bash-completion |              included in deps |               utility

