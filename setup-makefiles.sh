#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

export DEVICE=ali
export DEVICE_COMMON=msm8953-common
export VENDOR=motorola

"${MY_DIR}/setup-makefiles-common.sh" "$@"
