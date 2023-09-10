#!/bin/bash
HERE=$(pwd)

BRANCH="android-11.0.0_r29"

KERNEL="kernel/google/msm-4.14"
if [ ! -d "$KERNEL" ]; then
  git clone --depth=1 -b Android-13 https://github.com/Android-Unofficial/kernel_google_msm-4.14.git ${KERNEL}
  cd ${KERNEL}
  git submodule init
  git submodule update
  git submodule update --recursive --remote
  cd ${HERE}
else
  echo "No Need: ${KERNEL} is already available there."
fi

INTERFACES="hardware/google/interfaces"
if [ ! -d "$INTERFACES" ]; then
  git clone -b ${BRANCH} https://android.googlesource.com/platform/hardware/google/interfaces ${INTERFACES}
else
  echo "No Need: ${INTERFACES} is already available there."
fi

PIXEL="hardware/google/pixel"
if [ ! -d "$PIXEL" ]; then
  git clone -b ${BRANCH} https://android.googlesource.com/platform/hardware/google/pixel ${PIXEL}
else
  echo "No Need: ${PIXEL} is already available there."
fi

PSEPOLICY="hardware/google/pixel-sepolicy"
if [ ! -d "$PSEPOLICY" ]; then
  git clone -b ${BRANCH} https://android.googlesource.com/platform/hardware/google/pixel-sepolicy ${PSEPOLICY}
else
  echo "No Need: ${PSEPOLICY} is already available there."
fi

CSEPOLICY="device/google/coral-sepolicy"
if [ ! -d "$CSEPOLICY" ]; then
  git clone -b ${BRANCH} https://android.googlesource.com/device/google/coral-sepolicy ${CSEPOLICY}
else
  echo "No Need: ${CSEPOLICY} is already available there."
fi
