cp *.diff ../../../

cp -r toolchain/prebuilt ../../../

cd ../../../

patch -p1 < a2dp-fix.diff
patch -p1 < external-patch.diff
patch -p1 < fastaudio-fix.diff
patch -p1 < hardware-patch.diff
patch -p1 < init-cm-11-patch.diff
# patch -p1 < mircast-cm-11-patch.diff

rm *.diff
cd device/hisense/m470

