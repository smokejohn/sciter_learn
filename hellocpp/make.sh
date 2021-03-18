#!/bin/bash
./sciter/bin.lnx/packfolder ./source/ui ./source/resources.cpp -v "resources"
cmake -S ./ -B ./build
cmake --build ./build -- -j12
