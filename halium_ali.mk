# Minimal Halium system for Ubuntu Touch on the Moto G6 (ali)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/motorola/ali/device.mk)
$(call inherit-product, vendor/halium/config/halium.mk)

# vendor/lineage board configs (kernel variables for Soong) are keyed on this
LINEAGE_BUILD := ali

PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
PRODUCT_NAME := halium_ali
PRODUCT_DEVICE := ali
PRODUCT_MODEL := moto g(6)

BUILD_FINGERPRINT := motorola/ali/ali:9/PPS29.118-11/aa435:user/release-keys
