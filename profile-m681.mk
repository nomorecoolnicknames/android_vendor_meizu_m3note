# Profile m681 — m681 files with an l681 counterpart, plus the m681 modem set
# that m681-vendor.mk does not install.
M3NOTE_M681_SET_DIR := vendor/meizu/m681/proprietary

# modem (moved from the m681 donor device.mk, "modem (Альбина)" block):
# MOLY.LR11.W1603.MD.MP.V44.P6 for the Wingtech MZ6755 board.  ccci_mdinit
# probes /custom/etc/firmware then /vendor/firmware by variant name; ulwctg is
# the m681 variant.  The rest of the m681 modem set (modem_3_3g_n, catcher/em
# filters, mddb) comes from m681-vendor.mk.  On l681 m3note-profile.rc puts the
# L681H files over these names.
PRODUCT_COPY_FILES += \
    $(M3NOTE_M681_SET_DIR)/vendor/firmware/modem_1_ulwctg_n.img:$(TARGET_COPY_OUT_VENDOR)/firmware/modem_1_ulwctg_n.img \
    $(M3NOTE_M681_SET_DIR)/vendor/firmware/dsp_1_ulwctg_n.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/dsp_1_ulwctg_n.bin \
    $(M3NOTE_M681_SET_DIR)/vendor/firmware/boot_3_3g_n.rom:$(TARGET_COPY_OUT_VENDOR)/firmware/boot_3_3g_n.rom
