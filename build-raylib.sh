#/bin/bash

SRC=./raylib-5.0/src/
DEST=./build/raylib/
FILES=$(ls $SRC | grep "\.c" | sed -e "s/\.c//g")

rm ./build/raylib/*

for f in $FILES; do
	gcc -DPLATFORM_DESKTOP -fPIC -c $SRC$f.c -o $DEST$f.o -I"$SRC"external/glfw/include
done

chdir $DEST
ar rcs libraylib.a *.o
