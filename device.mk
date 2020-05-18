# Folder path
DEVICE_PATH := device/leeco/x3

# Vendor
$(call inherit-product, vendor/leeco/x3/x3-vendor-blobs.mk)

# Initial Product Shipping API Level of the Device
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

-include $(DEVICE_PATH)/hidl.mk

# AAPT
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi 420dpi xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := 420dpi
PRODUCT_AAPT_PREBUILT_DPI := normal hdpi xhdpi xxhdpi 420dpi xxxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := x3,X500,X507,X509,X3,x500,x507,x509,X502,x502

ifeq (lineage_x3,$(TARGET_PRODUCT))	#this is included only in lineage atm as some other roms have issue with this
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=64m \
	dalvik.vm.dex2oat-Xmx=64m \
	dalvik.vm.image-dex2oat-Xms=64m \
	dalvik.vm.image-dex2oat-Xmx=512m
endif

# Overlay Folder
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	audio_policy.default \
        audio_policy.stub \
	libaudio-resampler \
	libaudiopolicymanagerdefault \
	libtinyalsa \
	libtinycompress \
	libtinyxml \
        libtinyxml2 \
	tinymix \
	libfs_mgr

PRODUCT_PROPERTY_OVERRIDES += ro.af.client_heap_size_kbyte=7168

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/audio/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
	$(DEVICE_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
	$(DEVICE_PATH)/configs/audio/audio_em.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_em.xml \
	$(DEVICE_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_volumes.xml

# Bluetooth
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/bluetooth/auto_pair_blacklist.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/auto_pair_blacklist.conf \
	$(DEVICE_PATH)/configs/bluetooth/auto_pair_devlist.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/auto_pair_devlist.conf \
	$(DEVICE_PATH)/configs/bluetooth/btconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/btconfig.xml \
	$(DEVICE_PATH)/configs/bluetooth/bt_did.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_did.conf \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_stack.conf \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf.debug:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_stack.conf.debug \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf.sqc:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_stack.conf.sqc

PRODUCT_PACKAGES += \
    libbt-vendor \
    libbluetooth_mtk

PRODUCT_PROPERTY_OVERRIDES += ro.boot.btmacaddr=00:00:00:00:00:00

# Camera
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/camera/camerasize.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camerasize.xml

PRODUCT_PACKAGES += \
	libbwc \
	libm4u \
    libcamera_parameters_mtk

PRODUCT_PACKAGES += \
	Camera2 \
	Snap

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Device settings
PRODUCT_PACKAGES += \
    DeviceSettings

# Display
PRODUCT_PACKAGES += \
	libion

PRODUCT_PROPERTY_OVERRIDES += debug.hwui.use_buffer_age=false

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

# GPS
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/agps_profiles_conf2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/agps_profiles_conf2.xml

PRODUCT_PACKAGES += \
	gps.mt6795 \
	libcurl

# Graphics
PRODUCT_PACKAGES += \
    libgralloc_extra \
    libui_ext \
    libgui_ext

# Media / Codecs
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_ffmpeg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_ffmpeg.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml\
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
	$(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
	$(DEVICE_PATH)/configs/mtk_clear_motion.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mtk_clear_motion.cfg

# Modem controller / radio / Mtk Helpers
PRODUCT_PACKAGES += \
        md_ctrl \
	libccci_util \

PRODUCT_PACKAGES += \
	muxreport \
	terservice

PRODUCT_PACKAGES += libmtk_symbols

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
	frameworks/native/data/etc/android.software.sip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.manual_sensor.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.location.provider.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.location.provider.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.media.remotedisplay.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.media.remotedisplay.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.mediadrm.signer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.mediadrm.signer.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.manual_postprocessing.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
        $(DEVICE_PATH)/configs/permissions/privapp-permissions-leeco-x3.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-leeco-x3.xml

# keylayout
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
	$(DEVICE_PATH)/configs/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
	$(DEVICE_PATH)/configs/keylayout/mtk-tpd.kl:system/usr/keylayout/mtk-tpd.kl\
	$(DEVICE_PATH)/configs/keylayout/synaptics_dsx_i2c.kl:system/usr/keylayout/synaptics_dsx_i2c.kl

# LeEco's Prebuilt Apps
PRODUCT_PACKAGES += \
    GFManager \
    LetvRemoteControl_preinstall \
    UEIQuicksetSDKLeTV

# Lights
PRODUCT_PACKAGES += \
    lights.mt6795

# Ramdisk
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/ramdisk/enableswap.sh:$(TARGET_COPY_OUT_VENDOR)/bin/enableswap.sh \
	$(DEVICE_PATH)/ramdisk/factory_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/factory_init.project.rc \
	$(DEVICE_PATH)/ramdisk/factory_init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/factory_init.rc \
	$(DEVICE_PATH)/ramdisk/init.modem.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.modem.rc \
	$(DEVICE_PATH)/ramdisk/init.mt6795.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mt6795.rc \
	$(DEVICE_PATH)/ramdisk/init.mt6795.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mt6795.usb.rc \
	$(DEVICE_PATH)/ramdisk/init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.project.rc \
	$(DEVICE_PATH)/ramdisk/init.volte.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.volte.rc \
	$(DEVICE_PATH)/ramdisk/init.mal.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mal.rc \
	$(DEVICE_PATH)/ramdisk/init.trustonic.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.trustonic.rc \
 	$(DEVICE_PATH)/ramdisk/ueventd.mt6795.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

ifneq ($(ENABLED_VENDOR_PARTITION),true)
PRODUCT_COPY_FILES += \
        $(DEVICE_PATH)/ramdisk/fstab.mt6795:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6795
else
PRODUCT_COPY_FILES += \
       $(DEVICE_PATH)/ramdisk/fstab.vendor.mt6795:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6795
endif

# OpenGL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609
    vendor.ro.opengles.version=196609

# Others
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/ril_conf/ecc_list.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list.xml \
	$(DEVICE_PATH)/configs/ril_conf/spn-conf.xml:$(TARGET_COPY_OUT_VENDOR)/etc/spn-conf.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-run-hooks:$(TARGET_COPY_OUT_VENDOR)/etc/dhcpcd/dhcpcd-run-hooks \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-hooks/20-dns.conf:$(TARGET_COPY_OUT_VENDOR)/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
	$(DEVICE_PATH)/configs/dhcpcd/dhcpcd-hooks/95-configured:$(TARGET_COPY_OUT_VENDOR)/etc/dhcpcd/dhcpcd-hooks/95-configured \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6c.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wide-dhcpv6/dhcp6c.conf \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6c.script:$(TARGET_COPY_OUT_VENDOR)/etc/wide-dhcpv6/dhcp6c.script \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6cctlkey:$(TARGET_COPY_OUT_VENDOR)/etc/wide-dhcpv6/dhcp6cctlkey \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6cDNS.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wide-dhcpv6/dhcp6cDNS.conf \
	$(DEVICE_PATH)/configs/wide-dhcpv6/dhcp6s.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wide-dhcpv6/dhcp6s.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/radvd/radvd.conf:$(TARGET_COPY_OUT_VENDOR)/etc/radvd/radvd.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/slp_conf:$(TARGET_COPY_OUT_VENDOR)/etc/slp_conf \
	$(DEVICE_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
	$(DEVICE_PATH)/configs/clatd.conf:$(TARGET_COPY_OUT_VENDOR)/etc/clatd.conf \
	$(DEVICE_PATH)/configs/custom.conf:$(TARGET_COPY_OUT_VENDOR)/etc/custom.conf \
	$(DEVICE_PATH)/configs/mtklog-config.prop:$(TARGET_COPY_OUT_VENDOR)/etc/mtklog-config.prop \
	$(DEVICE_PATH)/configs/mtk_omx_core.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mtk_omx_core.cfg \
	$(DEVICE_PATH)/configs/perfservboosttbl.txt:$(TARGET_COPY_OUT_VENDOR)/etc/perfservboosttbl.txt \
	$(DEVICE_PATH)/configs/perfservscntbl.txt:$(TARGET_COPY_OUT_VENDOR)/etc/perfservscntbl.txt

# Configure jemalloc for low memory
MALLOC_SVELTE := true

PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PACKAGES += \
	librs_jni \
	libnl_2 \
	com.android.future.usb.accessory

# Power
PRODUCT_PACKAGES += \
	power.default \
	power.mt6795

# HIDL Manifest and Compatibility Matrix
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml \
    $(DEVICE_PATH)/configs/compatibility_matrix.xml:$(TARGET_COPY_OUT_VENDOR)/compatibility_matrix.xml

# Sensor Calibration
PRODUCT_PACKAGES += libem_sensor_jni

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(DEVICE_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Surfaceflinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.vsync_event_phase_offset_ns=-8000000 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=-8000000 \
    ro.surface_flinger.present_time_offset_from_vsync_ns=0 \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_virtual_display_dimension=2048 \
    ro.surface_flinger.running_without_sync_framework=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_phase_offset_ns=1500000 \
    debug.sf.early_app_phase_offset_ns=1500000 \
    debug.sf.early_gl_phase_offset_ns=3000000 \
    debug.sf.early_gl_app_phase_offset_ns=15000000

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1

# Torch
PRODUCT_PACKAGES += \
	Torch

# Wifi
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/hostapd/hostapd_default.conf:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd_default.conf \
	$(DEVICE_PATH)/configs/hostapd/hostapd.accept:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.accept \
	$(DEVICE_PATH)/configs/hostapd/hostapd.deny:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.deny

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
	lib_driver_cmd_mt66xx \
	libwpa_client \
	hostapd \
	wpa_supplicant \
        wificond

# XML Parser
PRODUCT_PACKAGES += libxml2
