ifeq (,$(wildcard hardware/amlogic/wifi/wifi-ext))
LOCAL_PATH := $(call my-dir)

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 && echo OK),OK)
MULTI_WIFI_PATH_32 := $(TARGET_OUT_VENDOR)/lib/
MULTI_WIFI_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/
else
MULTI_WIFI_PATH_32 := $(TARGET_OUT)/lib/
MULTI_WIFI_PATH_64 := $(TARGET_OUT)/lib64/
endif

include $(CLEAR_VARS)
LOCAL_MODULE := libwifi-hal-common-ext
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(MULTI_WIFI_PATH_32)
LOCAL_MODULE_PATH_64 := $(MULTI_WIFI_PATH_64)
LOCAL_SRC_FILES_arm := lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libbase libc++ libc libcutils libdl liblog libm libnetutils
include $(BUILD_PREBUILT)

endif
