# build tanos app

build tanos upper image, i.e. app image (including nav module)

## prerequisite
1. hard float gcc/g++
	gcc-4.7-arm-linux-gnueabihf
	g++-5.4-arm-linux-gnueabihf

 i am not sure which versions work, but the above combination works fine.
 this odd combination may be from that R16 uboot requires gcc 4.7

2. libconfig++9v5 libboost-program-options-dev libboost-all-dev
 host should install the pkgs, some tool use .so from the pkgs

## build flow

the following steps also work for other products, but the PRODUCT macro and architecture should be changed correctly for the destination product.

Tanos-V
-a=arm-linux-gnueabi -p=RR_PROJECT_TANOS_V
-DCMAKE_TOOLCHAIN_FILE=${ARCH}.cmake -DRR_PROJECT=${RR_PROJECT}


Tanos
-a=arm-linux-gnueabihf -p=RR_PROJECT_TANOS
-DCMAKE_TOOLCHAIN_FILE=arm-linux-gnueabihf.cmake -DRR_PROJECT=RR_PROJECT_TANOS


1.  git clone build repo, and checkout develop branch 

2.  submodule init and update
    git submodule init
    git submodule update --remote

3.  in build directory, git clone nav repo and checkout the branch you want

4.  build with bash script or instruction directly

### bash script

5. bash with args  
in build dir,
buildscripts/build_all.sh -o=/home/victor/Desktop/rockrobo/tanos/build/tanos_out -t=RelWithDebInfo -v=2019122606DEV -a=arm-linux-gnueabihf -p=RR_PROJECT_TANOS -e= --cleanbuild

-o should use full path, otherwis package-all.sh will fail


build ros simulated, add --simulate

buildscripts/build_all.sh -o=/home/victor/Desktop/rockrobo/tanos/build/tanos_out -t=RelWithDebInfo -v=2019122606DEV -a=arm-linux-gnueabihf -p=RR_PROJECT_TANOS -e= --simulate --cleanbuild 


result locates -o specified dir, the origin dir contains all apps.

PRODUCT package (something like PRODUCT_V2019122606DEV.tar.gz) will be used to generate ota package


### cmake instruction directly

5. cmake

in an empty dir,
cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_TOOLCHAIN_FILE=arm-linux-gnueabihf.cmake -DRR_PROJECT=RR_PROJECT_TANOS /home/victor/Desktop/rockrobo/tanos/build_nav/build

build ros simulated, add --simulate
cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_TOOLCHAIN_FILE=arm-linux-gnueabihf.cmake -DRR_PROJECT=RR_PROJECT_TANOS -DSIMULATE=True /home/victor/Desktop/rockrobo/tanos/build_nav/build

then 
make

result locates at
./nav/NavPlugin/librrnavdrv.so


## trouble shooting

1. if rriot project fails, add into daemon/rriot/CMakeLists.txt
add_compile_options(-std=c99)

