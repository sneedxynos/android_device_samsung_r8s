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
            # enable RAW on all cameras
            sed -i "s/ab022036/1f2003d5/g" "${2}".hex
            xxd -r -p "${2}".hex > "${2}"
            rm "${2}".hex
            ;;
        vendor/firmware/wlan/qcom_cfg.ini)
            sed -i 's/swlan0/wlan1/g' "${2}"
            sed -i 's/gChannelBondingMode24GHz=0/gChannelBondingMode24GHz=1/g' "${2}"
            ;;
	vendor/etc/init/wifi.rc)
	    sed -i 's/\/vendor\/bin\/hw\/macloader/\/vendor\/bin\/hw\/macloader\.sh/g' "${2}"
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=r8s
export DEVICE_COMMON=universal9830-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
