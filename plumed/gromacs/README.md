Gromacs with PLUMED2
=====

To use interactively use 
```
docker run --rm -it -v '/where/your/siminput/is:/home/whitelab/scratch' whitelab/plumed-gromacs bash
```
All files in `/where/your/siminput/is` directory will be shared between your machine and the container. Use the command `gromacs` to execute gromacs. You can also run a gromacs command without entering the container with:
```
docker run --rm -it -v 'where/your/siminput/is:/home/whitelab/scratch/' whitelab/plumed-gromacs gmx [command]
```

Notes
----

License
-----

* Copyright (c) University of Rochester
* Distributed under GPL License 3.0
