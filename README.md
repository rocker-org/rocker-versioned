# rocker-versioned #

This repository provides builds for explicit versions of R. This project
is under early development and the best way to go about this is not yet
clear.  Getting the correct version of R installed is not always trivial
but is relatively straight forward, and I outline two approaches below.

Getting the correct version of packages (or even merely any compatible
version of the package) to install is a considerably more difficult
problem, which I'll discuss later.

The rocker team is considering two different strategies, each with
strengths and weaknesses:

## Compiled builds ##

The most straight-forward recipe seems to be to adapt the `rocker/r-devel`
file to compile the desired version by pulling from the appropriate tag
in the R SVN repository, as suggested by @eddelbuettel


As Dirk suggested, we can build on the r-devel recipe, simply by pointing
to the appropriate tag.  Occassionally this needs a few extra packages
added to the list.  I was able to get R 2.0.0 to compile, but not R 1.0.0.
More recent versions than 2.0.0 don't seem to pose any difficulty for compiling.
Nonetheless, installing additional packages is still an issue.

## Binary builds ##

At different approach is to use the binary versions from old Debian images.
This approach works rather well when docker images are available for
earlier Debian releases (`oldstable` and `stable`, which currently go back
as far as Debian `6.0` and `7.0`; while the main rocker release builds
on Debian `testing` which is at `8.0`).  Merely using the earlier Debian
releases, we can jump back to certain versions of R:

- 6.0 : R 2.11.1
- 7.0 : R 2.15.1

The advantage of this is that binary forms of many common R packages may
also be available from the same repositories.

Dirk @eddelbuettel also suggests looking at [Debian snapshot
archive](http://snapshot.debian.org/) binaries. This allows us to install
intermediate versions of R in binary form, as well as specific versions of
any package for which debian binaries have been built.  The brilliant bit
about this is that we can add any particular snapshot time-period as a normal
repository, e.g.

```
deb     http://snapshot.debian.org/archive/debian/20091004T111800Z/ lenny main
deb-src http://snapshot.debian.org/archive/debian/20091004T111800Z/ lenny main
deb     http://snapshot.debian.org/archive/debian-security/20091004T121501Z/ lenny/updates main
deb-src http://snapshot.debian.org/archive/debian-security/20091004T121501Z/ lenny/updates main
```

and the package manage can thus handle all the dependencies. As noted, this
works only for those packages for which we have debian binaries available
in the release.

This is limited to what we can use as a base image, particularly for old
versions of R where the binaries are only available for i386 architectures
(while there are some Docker images providing i386 architectures, we've so
far used only amd64 versions). Given the rapid growth of R however, it is likely
that the preponderance of use-cases will focus on relatively recent R versions.


Unfortunately, I haven't gotten this working yet (See issue [#2](https://github.com/rocker-org/rocker-versioned/issues/2)).

## Installing R packages ##


Installing packages directly from CRAN is more dubious.  We may be able
to install earlier versions of particular packages from the CRAN archives
using the CRAN data from [metacran/crandb](https://github.com/metacran/crandb)
as @hadley recommended.

Hoping that we can do this more generally by building on @gmbecker 's work,
which does just this using R versions built as Amazon EC2 AMIs.  (See issue [#1](https://github.com/rocker-org/rocker-versioned/issues/1)).
