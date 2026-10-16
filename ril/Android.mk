# MediaTek property helper linked into the device's rild.
ifeq ($(TARGET_DEVICE),m3note)
ifeq ($(ENABLE_VENDOR_RIL_SERVICE),true)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := rild-prop-md1
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_SUFFIX := .a
LOCAL_PROPRIETARY_MODULE := true
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_MULTILIB := 64
LOCAL_SRC_FILES_64 := rild/arm64/rild-prop-md1.a
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := rild-prop-md1
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_SUFFIX := .a
LOCAL_PROPRIETARY_MODULE := true
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_MULTILIB := 32
LOCAL_SRC_FILES_32 := rild/arm/rild-prop-md1.a
include $(BUILD_PREBUILT)
endif
endif
