cp -r sounds ../../../frameworks/base/data/

cp build-mods.diff ../../../

cd ../../../

patch -p1 < build-mods.diff

rm build-mods.diff

