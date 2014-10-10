As Dirk suggested, we can build on the r-devel recipe, simply by pointing to the appropriate tag.  Occassionally this needs a few extra packages added to the list.  I was able to get R 2.0.0 to compile, but not R 1.0.0.

Note that at the moment, the old compiled version is avialable as `Rdevel` instead of `R` (the latter still points to 3.1.1).  Should be trivial to reset the aliases and remove the 3.1.1
