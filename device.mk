# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Vendor
$(call inherit-product, vendor/leeco/x3/x3-vendor-blobs.mk)

# Folder path
DEVICE_PATH := device/leeco/x3

-include $(DEVICE_PATH)/hidl.mk

# Overlay Folder
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := x3,X500,X507,X509,X3,x500,x507,x509,X502,x502

# Power
PRODUCT_PACKAGES += \
	power.default \
	power.mt6795

# Modem controller
PRODUCT_PACKAGES += \
        md_ctrl

# Camera
PRODUCT_PACKAGES += \
	Camera2 \
	Snap \
	libcamera_parameters_ext

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Torch
PRODUCT_PACKAGES += \
	Torch

# LeEco's Prebuilt Apps
PRODUCT_PACKAGES += \
        GFManager \
        LetvRemoteControl_preinstall \
        UEIQuicksetSDKLeTV

# Other
PRODUCT_PACKAGES += \
	librs_jni \
	libnl_2 \
	com.android.future.usb.accessory

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.allow.mock.location=0 \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	ro.zygote=zygote64_32 \
	ro.dalvik.vm.native.bridge=0 \
	persist.sys.usb.config=mtp \
	persist.debug.xlog.enable=0 \
	camera.disable_zsl_mode=1

ifeq (lineage_x3,$(TARGET_PRODUCT))	#this is included only in lineage atm as some other roms have issue with this
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=64m \
	dalvik.vm.dex2oat-Xmx=64m \
	dalvik.vm.image-dex2oat-Xms=64m \
	dalvik.vm.image-dex2oat-Xmx=512m
endif

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	audio_policy.default \
	libaudio-resampler \
	libaudiopolicymanagerdefault \
	libtinyalsa \
	libtinycompress \
	libtinyxml \
	audio_policy.stub \
	libtinymix \
	libfs_mgr

# Wifi
PRODUCT_PACKAGES += \
	lib_driver_cmd_mt66xx \
	libwpa_client \
	hostapd \
	wpa_supplicant \
        wificond \
        wifilogd

# Media
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/camera/camerasize.xml:system/etc/camerasize.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/vendor/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/vendor/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/vendor/etc/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/vendor/etc/media_codecs_google_video.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	fibmap.f2fs \
	fsck.f2fs \
	mkfs.f2fs \
	make_ext4fs \
	resize2fs \
	setup_fs \
	ext4_resize \
	libext2_blkid \
	libext2_uuid_static \
	superumount

# exFAT
PRODUCT_PACKAGES += \
	mount.exfat \
	fsck.exfat \
	mkfs.exfat

# NTFS
PRODUCT_PACKAGES += \
	fsck.ntfs \
	mkfs.ntfs \
	mount.ntfs

PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/ramdisk/enableswap.sh:root/enableswap.sh \
	$(DEVICE_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
	$(DEVICE_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
	$(DEVICE_PATH)/ramdisk/fstab.mt6795:root/fstab.mt6795 \
	$(DEVICE_PATH)/ramdisk/init.modem.rc:root/init.modem.rc \
	$(DEVICE_PATH)/ramdisk/init.mt6795.rc:root/init.mt6795.rc \
	$(DEVICE_PATH)/ramdisk/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
	$(DEVICE_PATH)/ramdisk/init.project.rc:root/init.project.rc \
	$(DEVICE_PATH)/ramdisk/ueventd.mt6795.rc:root/ueventd.mt6795.rc \
	$(DEVICE_PATH)/ramdisk/init.volte.rc:root/init.volte.rc \
	$(DEVICE_PATH)/ramdisk/init.mal.rc:root/init.mal.rc \
	$(DEVICE_PATH)/ramdisk/init.trustonic.rc:root/init.trustonic.rc

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/media/media_codecs.xml:system/vendor/etc/media_codecs.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_ffmpeg.xml:system/vendor/etc/media_codecs_ffmpeg.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_audio.xml:system/vendor/etc/media_codecs_mediatek_audio.xml\
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_video.xml:system/vendor/etc/media_codecs_mediatek_video.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_performance.xml:system/vendor/etc/media_codecs_performance.xml \
	$(DEVICE_PATH)/configs/media/media_profiles.xml:system/vendor/etc/media_profiles.xml \
	$(DEVICE_PATH)/configs/mtk_clear_motion.cfg:system/etc/mtk_clear_motion.cfg

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/audio/audio_device.xml:system/vendor/etc/audio_device.xml \
	$(DEVICE_PATH)/configs/audio/audio_effects.xml:system/vendor/etc/audio_effects.xml \
	$(DEVICE_PATH)/configs/audio/audio_em.xml:system/vendor/etc/audio_em.xml \
	$(DEVICE_PATH)/configs/audio/audio_policy.conf:system/vendor/etc/audio_policy.conf

# Audio Policy Configurations
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/vendor/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/vendor/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/vendor/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/vendor/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/vendor/etc/audio_policy_volumes.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.media.remotedisplay.xml:system/etc/permissions/com.android.media.remotedisplay.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.mediadrm.signer.xml:system/etc/permissions/com.android.mediadrm.signer.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant.conf:system/vendor/etc/wifi/wpa_supplicant.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/bluetooth/auto_pair_blacklist.conf:system/vendor/etc/bluetooth/auto_pair_blacklist.conf \
	$(DEVICE_PATH)/configs/bluetooth/auto_pair_devlist.conf:system/vendor/etc/bluetooth/auto_pair_devlist.conf \
	$(DEVICE_PATH)/configs/bluetooth/btconfig.xml:system/vendor/etc/bluetooth/btconfig.xml \
	$(DEVICE_PATH)/configs/bluetooth/bt_did.conf:system/vendor/etc/bluetooth/bt_did.conf \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf:system/vendor/etc/bluetooth/bt_stack.conf \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf.debug:system/vendor/etc/bluetooth/bt_stack.conf.debug \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf.sqc:system/vendor/etc/bluetooth/bt_stack.conf.sqc

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
	$(DEVICE_PATH)/configs/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
	$(DEVICE_PATH)/configs/keylayout/mtk-tpd.kl:system/usr/keylayout/mtk-tpd.kl\
	$(DEVICE_PATH)/configs/keylayout/synaptics_dsx_i2c.kl:system/usr/keylayout/synaptics_dsx_i2c.kl

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/ril_conf/ecc_list.xml:system/etc/ecc_list.xml \
	$(DEVICE_PATH)/configs/ril_conf/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6c.conf:system/etc/wide-dhcpv6/dhcp6c.conf \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6c.script:system/etc/wide-dhcpv6/dhcp6c.script \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6cctlkey:system/etc/wide-dhcpv6/dhcp6cctlkey \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6cDNS.conf:system/etc/wide-dhcpv6/dhcp6cDNS.conf \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6s.conf:system/etc/wide-dhcpv6/dhcp6s.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/radvd/radvd.conf:system/vendor/etc/radvd/radvd.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/slp_conf:system/etc/slp_conf \
	$(DEVICE_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
	$(DEVICE_PATH)/configs/clatd.conf:system/etc/clatd.conf \
	$(DEVICE_PATH)/configs/custom.conf:system/etc/custom.conf \
	$(DEVICE_PATH)/configs/mtklog-config.prop:system/etc/mtklog-config.prop \
	$(DEVICE_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg \
	$(DEVICE_PATH)/configs/perfservboosttbl.txt:system/etc/perfservboosttbl.txt \
	$(DEVICE_PATH)/configs/perfservscntbl.txt:system/etc/perfservscntbl.txt

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Mediaserver with system group
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/init/mediaserver.rc:system/etc/init/mediaserver.rc

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/hostapd/hostapd_default.conf:system/vendor/etc/hostapd/hostapd_default.conf \
	$(DEVICE_PATH)/configs/hostapd/hostapd.accept:system/vendor/etc/hostapd/hostapd.accept \
	$(DEVICE_PATH)/configs/hostapd/hostapd.deny:system/vendor/etc/hostapd/hostapd.deny


# MTK Helpers
PRODUCT_PACKAGES += \
	libccci_util \
	libmtk_symbols

# Sensor Calibration
PRODUCT_PACKAGES += libem_sensor_jni

# Configure jemalloc for low memory
MALLOC_SVELTE := true

# Radio dependencies
PRODUCT_PACKAGES += \
	muxreport \
	terservice

# Display
PRODUCT_PACKAGES += \
	libion

# Lights
PRODUCT_PACKAGES += \
        lights.mt6795

# GPS
PRODUCT_PACKAGES += \
	gps.mt6795 \
	libcurl

# camera
PRODUCT_PACKAGES += \
	libbwc \
	libm4u

#Camera Legacy
PRODUCT_PROPERTY_OVERRIDES += \
     media.stagefright.legacyencoder=true \
     media.stagefright.less-secure=true

# Vulkan
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/seccomp/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy
    $(DEVICE_PATH)/seccomp/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy

# HIDL Manifest
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/manifest.xml:system/vendor/manifest.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    libbluetooth_mtk

# Graphics
PRODUCT_PACKAGES += \
    libgralloc_extra \
    libui_ext \
    libgui_ext
