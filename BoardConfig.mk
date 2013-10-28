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

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/hisense/m470/bluetooth

TARGET_BOARD_PLATFORM := tegra3
TARGET_TEGRA_VERSION := t30

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488
BOARD_FLASH_BLOCK_SIZE := 4096

USE_CAMERA_STUB := false
USE_PROPRIETARY_AUDIO_EXTENSIONS := true
BOARD_LIB_DUMPSTATE := libdumpstate.m470
TARGET_RECOVERY_UI_LIB := librecovery_ui_m470
RECOVERY_FSTAB_VERSION := 2

-include vendor/hisense/m470/BoardConfigVendor.mk

TARGET_RECOVERY_FSTAB = device/hisense/m470/fstab.m470

TARGET_PREBUILT_KERNEL := device/hisense/m470/prebuilt/kernel/kernel

# Fix camera and load all nvlibs properly
BOARD_EGL_NEEDS_LEGACY_FB := true

# Wireless
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/vendor/firmware/fw_bcmdhd.bin nvram_path=/system/etc/nvram.txt iface_name=wlan0"

# Sensors invensense
BOARD_USES_GENERIC_INVENSENSE := true

TARGET_NO_BOOTLOADER := true

BOARD_HARDWARE_CLASS := device/hisense/m470/cmhw/

#BOARD_USES_GENERIC_AUDIO := false
#BOARD_USES_ALSA_AUDIO := false
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR0_CAMERA_BLOB

BOARD_USES_GENERIC_INVENSENSE := false

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/hisense/m470/prebuilt/lib/egl/egl.cfg

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

# Required for CWM
BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_SEPOLICY_DIRS += \
	device/hisense/m470/sepolicy
