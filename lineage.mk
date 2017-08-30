# Check for target product
ifeq (lineage_x3,$(TARGET_PRODUCT))

LOCAL_PATH := device/leeco/x3

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Release name
PRODUCT_RELEASE_NAME := x3

# Device display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_x3
PRODUCT_DEVICE := x3
PRODUCT_BRAND := LeEco
PRODUCT_MODEL := Le 1s
PRODUCT_MANUFACTURER := LeEco
PRODUCT_RESTRICT_VENDOR_FILES := false

# SDcard
PRODUCT_CHARACTERISTICS := nosdcard

# Google client ID property.
PRODUCT_GMS_CLIENTID_BASE := android-leeco

# Build fingerprint from Indian variant.
PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_FINGERPRINT=Letv/Le1s_IN/X3_HK:6.0/DHXOSOP5801911241S/1479990092:user/release-keys \
	PRIVATE_BUILD_DESC="full_x500-user 6.0 DHXOSOP5801911241S 1479990092 release-keys"

endif
