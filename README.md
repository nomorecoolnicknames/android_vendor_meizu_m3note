# Meizu M3 Note (M681 / L681) vendor blobs

Proprietary files for the Meizu M3 Note (M681 and L681, MT6755), LineageOS 20.0.

Used by [android_device_meizu_m3note](https://github.com/nomorecoolnicknames/android_device_meizu_m3note) (`lineage-20.0`).

One ROM serves both boards: `proprietary/m681` (stock Flyme 6, Android 7) is installed to `/vendor/meizu/m681`,
`proprietary/l681` (stock Flyme 6.3.0.0G, Android 5.1, plus the M681 files it needs on Android 13) to
`/vendor/meizu/l681`, and the device's init mounts the selected profile at boot. `profile-proof.json` lists every
profile file with its hash and origin.

The files are property of Meizu and MediaTek and keep their original terms.
