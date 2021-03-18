# Sciter Hello C++

This is a working sourcetree of the sciter Hello C++ tutorial for linux (https://sciter.com/hello-cpp-tutorial/)
This repository uses the Sciter SDK's linux files and CMake as a build system. So if you want to follow along the 
windows version of the tutorial of the official site on linux feel free to have a look at the files.

These files have been tested on Fedora WS 33 with:
 * CMake version 3.18.4
 * Sciter SDK (latest - 2021-03-18)

## Dependencies

 * CMake
 * Sciter SDK
 * GTK3

### Installing dependencies

Assuming RPM-based linux distro (Fedora WS 33)

#### Installing CMake
``` sh
$ sudo dnf install cmake
```

#### Getting Sciter SDK
Download the zip-file from the website https://sciter.com/download/.

Then Place the folders **`bin.lnx`** and **`include`** from the zip-archive in a folder called
**`sciter`** in the sourcetree like shown below.
```
.
└── hellocpp
    ├── sciter
    │   ├── bin.lnx
    │   ├── bin.win
    │   └── include
    └── source
        ├── cmake
        └── ui
```

Make sure that the **`packfolder`** binary file in the bin.lnx folder is executable (`chmod u+x packfolder`).
It is used during the compilation process.

#### Installing GTK3 Development files
``` sh
$ sudo dnf install gtk3-devel
```

## Building
If all your dependencies have been setup correctly building should be as easy as running the following
command in the **`hellocpp`** folder (sourcetree root)
``` sh
$ ./make.sh
```

## Running
If there are no error messages, all the binaries needed should be in the **`build`** folder. Running
the app is done with (again from hellocpp folder):
``` sh
$ ./build/hellocpp
```
