# c2k-off

`libviagpsrpc.so` here is an EMPTY file on purpose. It replaces the m681 blob at
`/vendor/lib/libviagpsrpc.so` (PRODUCT_COPY_FILES first rule wins, m3note-vendor.mk).

FACT (2026-10-05):
- l681 k0n, ROM 09-29: mtk_agpsd loops forever, one line per second
  (`VIARPCGPS: is_eccci_c2k_support 1 / retry times N`). After 100 retries it
  prints "modem interface not ready, timeout" and starts over. That is 1963
  lines in the radio buffer (a capture). It wakes the
  phone and floods the log.
- objdump: libviagpsrpc asks `query_prj_cfg_setting("MTK_ECCCI_C2K")`
  of libccci_util. libccci_util returns a hard-coded "1" (blob ProjectConfig,
  @0x1d38). The kernel declares no C2K (no CONFIG_MTK_ECCCI_C2K, MD3 off), and
  the ROM sets ro.mtk_c2k_support=0.
- Only mtk_agpsd uses the library: it dlopens /system/lib then
  /vendor/lib/libviagpsrpc.so ("cdma_mgr_dlopen_firmware failed" path exists).
  No other blob of the m681 set names it.

HYPOTHESIS H-AGPS-C2K: with the dlopen failing, mtk_agpsd drops only its VIA/C2K
AGPS part and the loop stops; GSM/LTE AGPS (SUPL via mnld) is unaffected.

Disconfirm on hardware:
- `logcat -b radio | grep -c VIARPCGPS` must be 0;
- "cdma_mgr_dlopen_firmware failed" must appear once, not in a loop;
- `init.svc.mtk_agpsd` stays running;
- a GPS fix with mobile data works (TTFF comparable).

If the loop does not stop, the alternative is an LD_SHIM for libviagpsrpc with
query_prj_cfg_setting("MTK_ECCCI_C2K") -> "0".
