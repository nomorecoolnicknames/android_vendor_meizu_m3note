# Profile l681 — L681H stock files (Flyme 6.3.0.0G intl, L91 layer) that the
# m681 set must not provide on l681.  Moved from device/meizu/l681/device.mk
# @7a10a6a (the "device-specific blobs from the L681H STOCK" block); the FACTs
# per group are kept there and the bring-up notes:
#  * modem MOLY.LR11.W1539.MD.MP.V9.P20 for the Huaqin HQ6755_66_B1A_L board
#    (the modem image carries the board's RF configuration);
#  * WMT ROMv2 patches of the L681H (WMT came up with them on 4.4);
#  * hwmsen sensors HAL + msensord + akmd09911 (LSM6DS3/PA122/AKM09911/BMP280),
#    instead of m681's InvenSense MPL HAL.
# NOT from here: WIFI_RAM_CODE_6755 — l681 runs the m681 build of it (the L681H
# one asserts on every scan on 4.4, flash-l681-16), installed by m681-vendor.mk.
#
# Destinations differ from the m681 ones, so nothing here shadows the m681
# set at build time:
#   /vendor/meizu/l681/...      bind-mounted by m3note-profile.rc on l681
#   sensors.l681.so             loaded through ro.hardware.sensors=l681 (libinit)
#   akmd09911, l681 mddb names  no m681 file of that name exists
L681_STOCK_DIR := vendor/meizu/m3note/proprietary/l681

M3NOTE_L681_DIR := $(TARGET_COPY_OUT_VENDOR)/meizu/l681

PRODUCT_COPY_FILES += \
    $(L681_STOCK_DIR)/etc/firmware/modem_1_ulwctg_n.img:$(M3NOTE_L681_DIR)/firmware/modem_1_ulwctg_n.img \
    $(L681_STOCK_DIR)/etc/firmware/dsp_1_ulwctg_n.bin:$(M3NOTE_L681_DIR)/firmware/dsp_1_ulwctg_n.bin \
    $(L681_STOCK_DIR)/etc/firmware/modem_3_3g_n.img:$(M3NOTE_L681_DIR)/firmware/modem_3_3g_n.img \
    $(L681_STOCK_DIR)/etc/firmware/catcher_filter_1_ulwctg_n.bin:$(M3NOTE_L681_DIR)/firmware/catcher_filter_1_ulwctg_n.bin \
    $(L681_STOCK_DIR)/etc/firmware/catcher_filter_3_3g_n.bin:$(M3NOTE_L681_DIR)/firmware/catcher_filter_3_3g_n.bin \
    $(L681_STOCK_DIR)/etc/firmware/em_filter_1_ulwctg_n.bin:$(M3NOTE_L681_DIR)/firmware/em_filter_1_ulwctg_n.bin \
    $(L681_STOCK_DIR)/etc/firmware/ROMv2_lm_patch_1_0_hdr.bin:$(M3NOTE_L681_DIR)/firmware/ROMv2_lm_patch_1_0_hdr.bin \
    $(L681_STOCK_DIR)/etc/firmware/ROMv2_lm_patch_1_1_hdr.bin:$(M3NOTE_L681_DIR)/firmware/ROMv2_lm_patch_1_1_hdr.bin \
    $(L681_STOCK_DIR)/etc/mddb/mdm_layout_desc_1_ulwctg_n.dat:$(M3NOTE_L681_DIR)/etc/mddb/mdm_layout_desc_1_ulwctg_n.dat \
    $(L681_STOCK_DIR)/bin/msensord:$(M3NOTE_L681_DIR)/bin/msensord \
    $(L681_STOCK_DIR)/etc/mddb/DbgInfo_LR11.W1539.MD.MP_HQ6755_66_B1A_L_MOLY_LR11_W1539_MD_MP_V9_P20_2016_11_16_19_58_1_ulwctg_n:$(TARGET_COPY_OUT_VENDOR)/etc/mddb/DbgInfo_LR11.W1539.MD.MP_HQ6755_66_B1A_L_MOLY_LR11_W1539_MD_MP_V9_P20_2016_11_16_19_58_1_ulwctg_n \
    $(L681_STOCK_DIR)/etc/mddb/MDDB_InfoCustomAppSrcP_MT6755_S00_MOLY_LR11_W1539_MD_MP_V9_P20_1_ulwctg_n.EDB:$(TARGET_COPY_OUT_VENDOR)/etc/mddb/MDDB_InfoCustomAppSrcP_MT6755_S00_MOLY_LR11_W1539_MD_MP_V9_P20_1_ulwctg_n.EDB \
    $(L681_STOCK_DIR)/etc/mddb/MDDB.META_MT6755_S00_MOLY_LR11_W1539_MD_MP_V9_P20_1_ulwctg_n.EDB:$(TARGET_COPY_OUT_VENDOR)/etc/mddb/MDDB.META_MT6755_S00_MOLY_LR11_W1539_MD_MP_V9_P20_1_ulwctg_n.EDB \
    $(L681_STOCK_DIR)/lib/hw/sensors.mt6755.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/sensors.l681.so \
    $(L681_STOCK_DIR)/lib64/hw/sensors.mt6755.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/sensors.l681.so \
    $(L681_STOCK_DIR)/bin/akmd09911:$(TARGET_COPY_OUT_VENDOR)/bin/akmd09911
