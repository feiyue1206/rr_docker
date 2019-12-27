#!/usr/bin/env bash
RUN_BASH_FILE_IN_IMG=1

# build with docker

dir=`pwd`
echo "current dir is $dir"
build_image=rr_qcbuildenv_img
docker_dir="/rrbuild/build"


dockerargs=" -v ${dir}:${docker_dir} "

#container_env=' -e "INSIDECONTAINER=-incontainer=true"'
docker="docker run --rm -it ${dockerargs} ${build_image}"

echo "begin to build tanos"

if [ ${RUN_BASH_FILE_IN_IMG} -eq 1 ]; then
	${docker} bash ${docker_dir}/rr_build.sh
else
    ${docker} bash -c \
        "cd /rrbuild/build/plugins/homesec;\
        make;\
        ls -al librr_plugin_homesec.so;\
        ls -al "
fi

echo "build ends"

#bash ./copy_to_robot_buildall.sh

#echo "copy to robot ends"