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

LOCAL_SHARED_LIBRARIES := \
       libcutils \
       libbinder \
       libutils \
       liblog \
       libgui \
       libui \
       libc \
       libandroidicu \
       libcrypto \
       libstagefright_foundation \
       libssl \
       libnativeloader \
       libEGL \
       libGLESv2 \
       libsync \
       libbase \
       libsensor

LOCAL_C_INCLUDES += \
       frameworks/av/media/ndk/include \
       frameworks/av/media/mtp \
       frameworks/av/include \
       frameworks/rs/server \
       frameworks/native/libs/sensor/include \
       frameworks/native/include \
       hardware/libhardware/include \
       system/core/include \

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
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
include $(BUILD_SHARED_LIBRARY)
