cp *.diff ../../../

cd ../../../

patch -p1 < audioflinger.diff
patch -p1 < broadcom.diff
# patch -p1 < broadcom-lite.diff
patch -p1 < libstagefright.diff
patch -p1 < MediaPlayerService.diff
patch -p1 < system.diff
patch -p1 < tinyalsa.diff
# patch -p1 < ucnv.diff
patch -p1 < wpa_supplicant.diff
# patch -p1 < wpa-patch.diff

# rm -rf system/extras/su

rm *.diff
cd device/hisense/m470

