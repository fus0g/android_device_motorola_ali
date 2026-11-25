#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Single vendor tree: vendor/${VENDOR}/${DEVICE} holds the common and the device blobs
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false

# Warning headers and guards
write_headers

# The standard common blobs, then the device blobs
write_makefiles "${MY_DIR}/proprietary-files-common.txt" true
if [ -s "${MY_DIR}/proprietary-files.txt" ]; then
    write_makefiles "${MY_DIR}/proprietary-files.txt" true
fi

# Finish
write_footers
