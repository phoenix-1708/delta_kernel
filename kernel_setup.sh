#!/bin/bash
#
# Copyright (c) 2021 CloudedQuartz
#

# Script to set up environment to build an android kernel
# Assumes required packages are already installed

git clone --depth=1 https://github.com/ArrowOS-Devices/android_kernel_xiaomi_sweet.git -b arrow-11.0
cd android_kernel_xiaomi_sweet


# Config
CURRENT_DIR="$(pwd)"
KERNELNAME="Delta"
KERNEL_DIR="$CURRENT_DIR"
AK_REPO="https://github.com/TheStaticDesign/AnyKernel3"
AK_BRANCH="sweet"
AK_DIR="$HOME/AnyKernel3"
TC_DIR="$HOME/proton-clang"
# TC_DIR="$HOME/linux-x86"
TC_DIR1="$HOME/aarch64-linux-android-4.9"
TC_DIR2="$HOME/arm-linux-androideabi-4.9"
# End Config

# clone_tc - clones proton clang to TC_DIR
clone_tc() {
	git clone --depth=1 https://github.com/kdrag0n/proton-clang.git $TC_DIR
	# git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 $TC_DIR
	git clone https://github.com/stormbreaker-project/aarch64-linux-android-4.9.git $TC_DIR1
	git clone https://github.com/stormbreaker-project/arm-linux-androideabi-4.9.git $TC_DIR2
}

# Clones anykernel
clone_ak() {
	git clone $AK_REPO $AK_DIR -b $AK_BRANCH
}
# Actually do stuff
clone_tc
clone_ak

# Run build script
# . ${CURRENT_DIR}/kernel_build.sh
wget https://raw.githubusercontent.com/phoenix-1708/delta_kernel/main/kernel_build.sh
source kernel_build.sh

