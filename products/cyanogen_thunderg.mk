# Inherit AOSP device configuration for legend.
$(call inherit-product, device/lge/thunderg/device_thunderg.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

PRODUCT_NAME := cyanogen_thunderg
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderg
PRODUCT_MODEL := LG-P500
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=optimus_one BUILD_ID=GRH55 BUILD_DISPLAY_ID=GRH55 BUILD_FINGERPRINT=google/soju/crespo:2.3/GRH55/79397:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3 GRH55 79397 release-keys"

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-legend.map

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    FM \
    LatinIME
CYANOGEN_WITH_GOOGLE := true
CYANOGEN_NIGHTLY := true

#PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/legend

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-Thuderg
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-RC0-Thunderg
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-RC0-Thunderg-mik
    endif
endif

PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
