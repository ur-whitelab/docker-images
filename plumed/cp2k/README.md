CP2K with PLUMED2
=====

To use interactively use 
```
docker run --rm -it -v '/where/your/siminput/is:/home/whitelab/scratch' whitelab/plumed-cp2k bash
```
All files in `/where/your/siminput/is` directory will be shared between your machine and the container. Use the command `cp2k` to execute cp2k. You can also run an input script without entering the container with this command:
```
docker run --rm -it -v 'where/your/siminput/is:/home/whitelab/scratch/' whitelab/plumed-cp2k cp2k input_file
```

Notes
----

This is a single-node OpenMP parallelized version (ssmp), although you
can change the Dockerfile to use different versions.

License
-----

* Copyright (c) University of Rochester
* Distributed under GPL License 3.0
