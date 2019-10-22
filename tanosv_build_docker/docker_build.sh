#!/usr/bin/env bash

RUN_BASH_FILE=1


# cp what's newer to this dir



dir=`pwd`
echo "current dir is $dir"
build_image=rr_qcbuildenv_img

dockerargs=" -v ${dir}:/rrbuild/build "
#container_env=' -e "INSIDECONTAINER=-incontainer=true"'
docker="docker run --rm -it ${dockerargs} ${build_image}"

echo "begin to build tanos"

if [ ${RUN_BASH_FILE} -eq 1 ]; then
	${docker} bash tanos-v_build.sh
else
    ${docker} bash -c \
        "rm /rrbuild/build/CMakeCache.txt; \
        cd /rrbuild/build/;\
        buildscripts/build_all.sh -o=/rrbuild/build/output -t=RelWithDebInfo -v=2019091800DEV -a=arm-linux-gnueabi -p=RR_PROJECT_TANOS_V -e= --cleanbuild; \
        ls -al /rrbuild/build/temp/arm"
fi


echo "build ends"

