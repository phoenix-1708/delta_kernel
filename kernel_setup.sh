#!/bin/bash
#
# Copyright (c) 2021 CloudedQuartz
#

# Script to set up environment to build an android kernel
# Assumes required packages are already installed

# git clone --depth=1 https://github.com/ArrowOS-Devices/android_kernel_xiaomi_sweet.git -b arrow-11.0
git clone --depth=1 https://github.com/TheStaticDesign/android_kernel_xiaomi_sweet.git -b 11
cd android_kernel_xiaomi_sweet
rm -rf kernel_setup.sh
rn -rf kernel_build.sh
rm -rf $(pwd)/arch/arm64/configs/vendor/sweet_defconfig
git clone --depth=1 https://github.com/phoenix-1708/delta_kernel.git delta_kernel
cp $(pwd)/delta_kernel/sweet_defconfig $(pwd)/arch/arm64/configs/vendor/sweet_defconfig

# Config
CURRENT_DIR="$(pwd)"

KERNELNAME="PhoenixKernel"
KERNEL_DIR="$CURRENT_DIR"
AK_REPO="https://github.com/TheStaticDesign/AnyKernel3"
AK_BRANCH="sweet"
AK_DIR="$HOME/AnyKernel3"
TC_DIR="$HOME/proton-clang"
# TC_DIR="$HOME/linux-x86"
# TC_DIR1="$HOME/aarch64-linux-android-4.9"
# TC_DIR2="$HOME/arm-linux-androideabi-4.9"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
# End Config

# clone_tc - clones proton clang to TC_DIR
clone_tc() {
	git clone --depth=1 https://github.com/kdrag0n/proton-clang.git $TC_DIR
	# git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 $TC_DIR
	# git clone https://github.com/stormbreaker-project/aarch64-linux-android-4.9.git $TC_DIR1
	# git clone https://github.com/stormbreaker-project/arm-linux-androideabi-4.9.git $TC_DIR2
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

