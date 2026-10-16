# vendor/meizu/m3note — vendor of the common M3 Note Android 9 ROM (m681 + l681).
#
# Base set for BOTH revisions: the m681 LOS16 vendor (vendor/meizu/m681,
# blobs in its proprietary/, not here).  FACT: l681 already runs Android 9 on
# exactly this set (the bring-up notes):
# Mali r5p0 GLES/gralloc, HWC, audio, RIL, camera HAL, MobiCore — the l681
# stock is Android 5.1 and has no Nougat set of its own.
#
# On top of it two revision profiles.  Every file is installed on every
# phone; libinit (device/meizu/m3note/libinit) sets ro.vendor.meizu.profile
# from the device tree, and the profile is activated at runtime:
#   * same-name files (modem, WMT patches, msensord, mdm layout): the m681 file
#     is at its normal path, the l681 file under /vendor/meizu/l681/, and
#     m3note-profile.rc bind-mounts it over the m681 one on l681;
#   * HALs: variant names chosen by ro.hardware.<class> (sensors.l681.so,
#     keystore.m681tee.so), set by libinit.
# What differs and why: the bring-up notes
# C2K AGPS RPC off on both revisions (the bring-up notes): an empty
# libviagpsrpc.so takes the destination first -- PRODUCT_COPY_FILES keeps the
# FIRST rule per destination, and the entries of an inherited makefile land at
# the position of its inherit line, so this MUST stay above it.
PRODUCT_COPY_FILES += \
    vendor/meizu/m3note/c2k-off/libviagpsrpc.so:$(TARGET_COPY_OUT_VENDOR)/lib/libviagpsrpc.so

$(call inherit-product, vendor/meizu/m681/m681-vendor.mk)
$(call inherit-product, vendor/meizu/m3note/profile-m681.mk)
$(call inherit-product, vendor/meizu/m3note/profile-l681.mk)

PRODUCT_COPY_FILES += \
    vendor/meizu/m3note/m3note-profile.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/m3note-profile.rc
