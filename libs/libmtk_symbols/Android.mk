LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	MediatekHacks.cpp \
        Buffer.cpp \
        fence.cpp \
	mtkcamhack.cpp \
        mtk_jpeg.cpp \
	mtk_ui.cpp \
	mtk_omx.cpp \
	icu55.c \
	crypto.c \
	ssl.c \
        sensorlistener/ISensorServer.cpp \
        sensorlistener/SensorManager.cpp \
        CameraParameters.cpp \
        bionic/pthread_mutex_destroy.cpp

# only for 32bit libraries
LOCAL_SRC_FILES_32 := mtk_string.cpp

# only for 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp


LOCAL_SHARED_LIBRARIES := libcutils libbinder libutils liblog libgui libui libc  libicuuc libicui18n libcrypto libstagefright_foundation libssl libnativeloader libEGL  libGLESv2 libsync libbase libsensor libcam.utils.sensorlistener
LOCAL_C_INCLUDES += frameworks/av/media/mtp/ system/core/include/ frameworks/rs/server/ frameworks/av/include/ hardware/libhardware/include/ frameworks/native/libs/sensor/include/ frameworks/native/include
LOCAL_MODULE := libmtk_symbols
LOCAL_MODULE_TAGS := optional

LOCAL_CLANG := true
LOCAL_CPPFLAGS := -std=c++1y
# LOCAL_SANITIZE := integer
LOCAL_CPPFLAGS += -Wno-exit-time-destructors
LOCAL_CPPFLAGS += -Wno-global-constructors
LOCAL_CPPFLAGS += -Wno-c++98-compat-pedantic
LOCAL_CPPFLAGS += -Wno-four-char-constants
LOCAL_CPPFLAGS += -Wno-padded
LOCAL_PROPRIETARY_MODULE = true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
        fence.cpp

LOCAL_SHARED_LIBRARIES := libui
LOCAL_MODULE := mtkui
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := libc.cpp
LOCAL_SHARED_LIBRARIES := libc libutilscallstack
LOCAL_MODULE := mtkc
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# mtklog
include $(CLEAR_VARS)
LOCAL_SRC_FILES := liblog.c
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := mtklog
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
