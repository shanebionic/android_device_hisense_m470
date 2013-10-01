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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
# The proprietary variant sets USE_CAMERA_STUB := false, this way
# we use the camera stub when the vendor tree isn't present, and
# the true camera library when the vendor tree is available.  Similarly,
# we set USE_PROPRIETARY_AUDIO_EXTENSIONS to true in the proprietary variant as
# well.
USE_CAMERA_STUB := false
USE_PROPRIETARY_AUDIO_EXTENSIONS := false

BOARD_LIB_DUMPSTATE := libdumpstate.m470

TARGET_RELEASETOOLS_EXTENSIONS := device/hisense/m470

# End Warning

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

# Wifi related defines
WIFI_BAND := 802_11_ABGN
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_MODULE_NAME     := bcmdhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/bcm4330/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin"
#WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/vendor/firmware/fw_bcmdhd.bin nvram_path=/system/etc/nvram_4330.txt iface_name=wlan0"

TARGET_BOOTLOADER_BOARD_NAME := m470
TARGET_NO_BOOTLOADER := true

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false
#COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB

BOARD_USES_GENERIC_INVENSENSE := false

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/hisense/m470/egl.cfg

ifneq ($(HAVE_NVIDIA_PROP_SRC),false)
# needed for source compilation of nvidia libraries
include vendor/nvidia/proprietary_src/build/definitions.mk
include vendor/nvidia/build/definitions.mk
endif

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

# Required for CWM
BOARD_HAS_NO_SELECT_BUTTON := true

#TARGET_KERNEL_SOURCE := kernel/asus/grouper
#TARGET_KERNEL_CONFIG := cyanogenmod_grouper_defconfig
TARGET_PREBUILT_KERNEL := device/hisense/m470/prebuilt/kernel/kernel
TARGET_PREBUILT_WIFI_MODULE := device/hisense/m470/prebuilt/kernel/modules/bcmdhd.ko

BOARD_SEPOLICY_DIRS += \
	device/hisense/m470/sepolicy

BOARD_SEPOLICY_UNION += \
	file_contexts \
	genfs_contexts \
	app.te \
	btmacreader.te \
	device.te \
	drmserver.te \
	file.te \
	gpsd.te \
	init_shell.te \
	keystore.te \
	mediaserver.te \
	rild.te \
	sensors_config.te \
	surfaceflinger.te \
	system.te \
	zygote.te

#TARGET_RECOVERY_UI_LIB := librecovery_ui_m470
TARGET_RECOVERY_FSTAB = device/hisense/m470/fstab.m470
RECOVERY_FSTAB_VERSION := 2
TARGET_PREBUILT_RECOVERY_KERNEL := device/hisense/m470/prebuilt/kernel/kernel

# USB 
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun/file"
