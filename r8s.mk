#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from r8s device
$(call inherit-product, device/samsung/r8s/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/leaf/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := r8s
PRODUCT_NAME := r8s
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G780F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=r8sxx \
    PRIVATE_BUILD_DESC="r8sxx-user 11 RP1A.200720.012 G780FXXSDFWH8 release-keys"

BUILD_FINGERPRINT := samsung/r8sxx/r8s:11/RP1A.200720.012/G780FXXSDFWH8:user/release-keys

# Define PDA property for camera
PRODUCT_SYSTEM_PROPERTIES += \
    ro.build.PDA=G780FXXSDFWH8
