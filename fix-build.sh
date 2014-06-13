cp -r sounds ../../../frameworks/base/data/

cp -r toolchain/prebuilt ../../../

cp build-mods.diff ../../../

cd ../../../

patch -p1 < build-mods.diff

rm build-mods.diff

rm -rf system/extras/su


