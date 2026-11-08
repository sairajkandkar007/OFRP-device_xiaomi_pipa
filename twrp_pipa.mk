# Inherit from these configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from device configuration
$(call inherit-product, device/xiaomi/pipa/device.mk)

# Inherit from TWRP common configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Import OrangeFox specifics
$(call inherit-product, device/xiaomi/pipa/fox_pipa.mk)

PRODUCT_DEVICE := pipa
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Pad 6
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := twrp_$(PRODUCT_DEVICE)
