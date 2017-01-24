#!/bin/bash
#
# Build the ai-os build directory


if [ ! -d "../Build" ]; then
mkdir ../Build
fi

cd ../Build
#This will be the AI-OS root directory
if [ ! -d "aios" ]; then
mkdir aios
fi

#The aios root folder. This will contain all toolchain and even te final builds
cd aios

export AIOS=$(pwd)
echo "AIOS env variable Set to $AIOS"
export AIOS_TGT=aios-$(uname -m)

#Create a symbolic link to the Packages folder so that we can use it to build the toolchain and root
if [ -d "sources" ]; then
rm -rf sources
fi

ln -s $(pwd)/../../Packages ./sources

#Modify the permissions 
chmod -v a+wt $AIOS/sources

#Create the tools directory
if [ ! -d "tools" ]; then
mkdir tools
fi

