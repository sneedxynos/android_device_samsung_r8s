#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib64/libexynoscamera3.so)
            xxd -p "${2}" | tr -d \\n > "${2}".hex
            # NOP SecCameraIPCtoRIL::enable m_sendRequest()
            sed -i "s/140000940a000014/1f2003d50a000014/g" "${2}".hex
            # NOP SecCameraIPCtoRIL::disable m_sendRequest()
            sed -i "s/a8ffff970a000014/1f2003d50a000014/g" "${2}".hex
            xxd -r -p "${2}".hex > "${2}"
            rm "${2}".hex
            ;;
        vendor/lib*/libsec-ril*.so)
            "${PATCHELF}" --replace-needed libril.so libril-samsung.so "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=x1slte
export DEVICE_COMMON=universal990-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
