#
# Copyright (C) 2010 The Android Open Source Project
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

# Kernel
ifneq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/hisense/m470/prebuilt/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

endif

# Kernel modules REMEMBER TO REMOVE IF EVER WE GET KERNEL SOURCE
PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/kernel/modules/baseband_usb_chr.ko:system/lib/modules/baseband_usb_chr.ko \
    device/hisense/m470/prebuilt/kernel/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/hisense/m470/prebuilt/kernel/modules/cfg80211.ko:system/lib/modules/cfg80211.ko \
    device/hisense/m470/prebuilt/kernel/modules/gps_drv.ko:system/lib/modules/gps_drv.ko \
    device/hisense/m470/prebuilt/kernel/modules/lib80211.ko:system/lib/modules/lib80211.ko \
    device/hisense/m470/prebuilt/kernel/modules/mac80211.ko:system/lib/modules/mac80211.ko \
    device/hisense/m470/prebuilt/kernel/modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
    device/hisense/m470/prebuilt/kernel/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/hisense/m470/prebuilt/kernel/modules/tcrypt.ko:system/lib/modules/tcrypt.ko

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi


PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    tf.enable=y \
    drm.service.enabled=true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/hisense/m470/fstab.m470:root/fstab.m470 \
    device/hisense/m470/ueventd.m470.rc:root/ueventd.m470.rc \
    device/hisense/m470/init.m470.usb.rc:root/init.m470.usb.rc \
    device/hisense/m470/gps.conf:system/etc/gps.conf

ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcmdhd.ko
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += \
    device/hisense/m470/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    device/hisense/m470/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

PRODUCT_PACKAGES := \
    audio.primary.m470 \
    audio.a2dp.default \
    lights.m470 \
    librs_jni \
    setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    keystore.m470


# Include Proprietary files
include vendor/hisense/m470/device-vendor.mk

# NFC packages
PRODUCT_PACKAGES += \
    nfc.m470 \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_CHARACTERISTICS := tablet

# build wireless firmware instead of using prebuilts
WIFI_BAND := 802_11_ABGN
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    device/hisense/m470/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    device/hisense/m470/media_codecs.xml:system/etc/media_codecs.xml

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf

# audio mixer paths
PRODUCT_COPY_FILES += \
    device/hisense/m470/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    device/hisense/m470/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# NFCEE access control
    NFCEE_ACCESS_PATH := device/hisense/m470/nfcee_access.xml

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml
