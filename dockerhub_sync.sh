#!/bin/bash

for i in `find -name Dockerfile`; do
    DIR=`dirname $i`;
    TAG=`dirname $i | sed 's/\.\/\(.*\)/\1/' | sed 's/\//-/g'`;
    echo "docker build -t $TAG $DIR;"
    echo "docker tag $TAG whitelab/$TAG;"
    echo "docker push whitelab/$TAG;"
done;
