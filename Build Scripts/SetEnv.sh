#!/bin/bash
#
# Written by Subhojeet Pramanik
#
# Set up environment variables AIOS and AIOS_TGT for 
# for building the toolchain. Also set the PATH for
# the current bash profile



# The exec env -i.../bin/bash command in the .bash_profile file 
# replaces the running shell with a new one with a completely empty environment, except for the HOME, TERM, 
# and PS1 variables. This ensures that no unwanted and potentially hazardous
# environment variables from the host system leak into the build environment
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

# Set the variables and save in .bashrc file
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF


# Finally, to have the environment fully prepared for building the temporary tools, 
# source the just-created user profile
source ~/.bash_profile
