# NOTE: merge with your existing device.mk instead of overwriting if it has extra lines.
DEVICE_PATH := device/xiaomi/pipa

# Virtual A/B: pick to match stock (getprop ro.virtual_ab.compression.enabled)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
# $(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

TARGET_OTA_ASSERT_DEVICE := pipa

# FastbootD support
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Boot control HAL (Qualcomm implementation)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# API (Pad 6 launched on Android 13)
PRODUCT_SHIPPING_API_LEVEL := 33
BOARD_SHIPPING_API_LEVEL := 33
PRODUCT_TARGET_VNDK_VERSION := 33

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_CHARACTERISTICS := tablet,nosdcard

# TWRP specifics
TW_INCLUDE_WIFI := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Lets decryption work with any ROM version
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2026-04-01
VENDOR_SECURITY_PATCH := 2026-02-01
BOOT_SECURITY_PATCH := 2026-04-01
