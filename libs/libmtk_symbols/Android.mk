
LOCAL_PATH := $(call my-dir)

# mtkc
include $(CLEAR_VARS)
LOCAL_SRC_FILES := xlog.c
LOCAL_SHARED_LIBRARIES := libc liblog
LOCAL_MODULE := mtkc
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
