For R 2.11.0 and later, the binary strategy works rather well.

- We can get Docker base images as far back as Debian:6.0 (Squeeze), which is currently the `debian:oldstable` release. This installs R 2.11.0 out of the box. See `2.11.0` directory.

- We can then upgrade to later R versions, e.g. R 2.12, by grabbing the binaries explicitly as Dirk suggested, from the Debian snapshot archives: http://snapshot.debian.org/package/r-base/2.12.0-1/ .  See the `2.12.0` directory for example.

- We might want to skip forward to Debian:7 for R 2.15.1 and later.

- Note that we'll want to grab the amd-64 versions for the binaries, or this won't work.  i386 Dockerfiles are avialable and will be necessary to attempt this on older R versions.  However, in my testing those often required additional dependencies that could not be found in the current image repos, and would have to be pulled from the snapshot manually/with a custom script, as far as I can see.

Altenatively, we can just install these from source by pulling from the SVN tags.


