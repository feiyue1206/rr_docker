## rr_docker

# Description from leon

Monday, August 20, 2018 (Mon) 19:08
交叉编译环境配置：
1. 安装g++-arm-linux-gnueabi （可以直接apt  install安装）
2. 从repo http://alias@rocksrv02/git/gnu/gcc-cross.git  clone内容，用gcc-cross文件夹内容拷贝覆盖系统目录，覆盖后终端确认 arm-linux-gnueabi-gcc 版本，为 8.2.0 是正确的。

Ruby2代码build：
1.  从 repo   http://alias@rocksrv02/git/robot/ruby2/build.git  clone代码
2.  checkout 到 branch ruby2/develop
3.  init & update submodule 
4.  建立armbuild目录，在armbuild文件夹中用命令 cmake -DCMAKE_TOOLCHAIN_FILE=../arm-linux-gnueabi.cmak -DCMAKE_BUILD_TYPE=Debug ../  && make 进行编译（后期会写build脚本，现在暂时用命令build）

# docker ins

docker build -t=rr_qcbuildenv_img .

docker run -it --rm --name tanosv_build_env rr_qcbuildenv_img /bin/bash


docker run -it --rm -v ${dir}:/rrbuild/build --name tanosv_build_env rr_qcbuildenv_img /bin/bash

docker run -it --rm -v /home/victor/Desktop/rockrobo/tanosv/build:/rrbuild/build --name tanosv_build_env rr_qcbuildenv_img /bin/bash


# build tanosv flow

1.build docker img or get img from docker hub


docker pull feiyue1206/rr_qcbuildenv_img:201126
    fix libconfig++.so


docker build -t=rr_qcbuildenv_img .

docker pull feiyue1206/rr_qcbuildenv_img:latest

docker push feiyue1206/rr_qcbuildenv_img:latest




2.run docker build instruction

./docker_build.sh


## build single module only

1. run docker container 

docker run -it --rm -v /home/victor/Desktop/rockrobo/tanosv/build:/rrbuild/build --name tanosv_build_env rr_qcbuildenv_img /bin/bash

docker run -it --rm -v /home/victor/Desktop/rockrobo/tanosv/build:/rrbuild/build --name tanosv_build_env2 rr_qcbuildenv_img /bin/bash


2. cmake 

cd /rrbuild/build

cmake -DCMAKE_TOOLCHAIN_FILE=/rrbuild/build/arm-linux-gnueabi.cmake -DRR_PROJECT=RR_PROJECT_TANOS_V .

make

cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_TOOLCHAIN_FILE=/rrbuild/build/arm-linux-gnueabi.cmake -DRR_PROJECT=RR_PROJECT_TANOS_V .




cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=${CMK_BUILD_TYPE} -DCMAKE_TOOLCHAIN_FILE=${ARCH}.cmake -DRR_PROJECT=${RR_PROJECT} ${OTHERPARAMETERS} ${TRACE_CONSOLE} ${SOURCE_DIR}

cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_TOOLCHAIN_FILE=arm-linux-gnueabi.cmake -DRR_PROJECT=RR_PROJECT_TANOS_V /var/lib/jenkins/workspace/Tanos-V_EnSecureBoot_EnSelinux_FULL/build


3. single module build

then cd to the module dir, cp and run




docker run -it --rm -v /home/victor/Desktop/rockrobo/tanosv/test_build/build:/rrbuild/build --name tanosv_build_env2 rr_qcbuildenv_img /bin/bash

