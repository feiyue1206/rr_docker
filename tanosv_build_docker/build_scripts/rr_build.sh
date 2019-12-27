#!/usr/bin/env bash
echo "rr_build.sh for build rockrobo "
echo "begin to build tanosv in docker "

 
FILE=/rrbuild/build/CMakeCache.txt
if [ -f "$FILE" ]; then
    echo "$FILE exist, so delete it "
    rm $FILE
fi


cd /rrbuild/build/;

buildscripts/build_all.sh -o=/rrbuild/build/output -t=RelWithDebInfo -v=2019091800DEV -a=arm-linux-gnueabi -p=RR_PROJECT_TANOS_V -e= --cleanbuild; 
#buildscripts/build_all.sh -o=output -t=RelWithDebInfo -v=2019091800DEV -a=arm-linux-gnueabi -p=RR_PROJECT_TANOS_V -e= --cleanbuild

ls -al /rrbuild/build/temp/arm

echo "build in docker ends successfully"

