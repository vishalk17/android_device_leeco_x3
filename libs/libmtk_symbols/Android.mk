
LOCAL_PATH := $(call my-dir)

# mtkc
include $(CLEAR_VARS)
LOCAL_SRC_FILES := libc.cpp
LOCAL_SHARED_LIBRARIES := libc libutilscallstack
LOCAL_MODULE := mtkc
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
