Lammps with Electronic Dance Music
=====

See (github.com/whitead/electronic-dance-music)[https://github.com/whitead/electronic-dance-music]

Usage
----

To use interactively use 
```
docker run --rm -it -v '/where/your/siminput/is:/home/whitelab/scratch' whitelab/plumed-lammps bash
```
All files in `/where/your/siminput/is` directory will be shared between your machine and the container. Use the command `lammps` to execute lammps. You can also run an input script without entering the container with this command:
```
docker run --rm -it -v 'where/your/siminput/is:/home/whitelab/scratch/' whitelab/plumed-lammps lammps -in input_file
```

Notes
----

License
-----

* Copyright (c) University of Rochester
* Distributed under GPL License 3.0
