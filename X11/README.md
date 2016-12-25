## X11 Dockerfile README

This Dockerfile just provides an example of what libraries should be added to have a functioning X11 system.
Note that using X11 windows from Docker requires X11 be installed and linked on the host; this can be non-trivial,
particularly on non-Linux hosts.

On a Ubuntu Linux host, I find the following command works. Note that we can use the R function `capabilities()`
to confirm X11 support.

As this Dockerfile is just here for illustrative purposes, there is no pre-built or version-tagged image for X11
on the Hub, but the image can be quickly built from the Dockerfile here.

```bash
docker build -t rocker/x11 .
XSOCK=/tmp/.X11-unix && XAUTH=/tmp/.docker.xauth && xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && docker run  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY --rm -it rocker/x11 R -e "capabilities()" 

```

```r
> capabilities()
       jpeg         png        tiff       tcltk         X11        aqua 
       TRUE        TRUE        TRUE       FALSE        TRUE       FALSE 
   http/ftp     sockets      libxml        fifo      cledit       iconv 
       TRUE        TRUE        TRUE        TRUE       FALSE        TRUE 
        NLS     profmem       cairo         ICU long.double     libcurl 
      FALSE        TRUE        TRUE        TRUE        TRUE        TRUE 
> 
```
