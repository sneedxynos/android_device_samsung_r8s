#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/x1slte

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/mixer_gains.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_gains.xml

# Boot Animation
TARGET_SCREEN_HEIGHT := 3200
TARGET_SCREEN_WIDTH := 1440

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Inherit from common
$(call inherit-product, device/samsung/universal990-common/device-common.mk)

# Inherit from the proprietary version
$(call inherit-product-if-exists, vendor/samsung/x1slte/x1slte-vendor.mk)
