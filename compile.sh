#!/bin/sh
sudo apt install -y flex bison python3-mako libwayland-egl-backend-dev  lm-sensors libxcb-dri3-dev libxcb-dri2-0-dev libxcb-glx0-dev libx11-xcb-dev libxcb-present-dev libxcb-sync-dev libxxf86vm-dev libxshmfence-dev libxrandr-dev libwayland-dev libxdamage-dev libxext-dev libxfixes-dev x11proto-dri2-dev x11proto-dri3-dev x11proto-present-dev x11proto-gl-dev x11proto-xf86vidmode-dev libexpat1-dev libudev-dev gettext glmark2 glmark2-es2 mesa-utils xutils-dev libpthread-stubs0-dev ninja-build bc python-pip flex bison cmake git valgrind llvm llvm-8-dev python3-pip  pkg-config zlib1g-dev wayland-protocols -y
wget http://fr.archive.ubuntu.com/ubuntu/pool/universe/m/meson/meson_0.49.0-2ubuntu1_all.deb
sudo dpkg -i meson_0.49.0-2ubuntu1_all.deb
git clone git://anongit.freedesktop.org/mesa/drm
cd drm
meson build --prefix=/usr
ninja -C build
sudo -E ninja -C build install
cd ..
git clone git://anongit.freedesktop.org/mesa/mesa
cd mesa
meson -Ddri-drivers= -Dvulkan-drivers= -Dgallium-drivers=panfrost,kmsro -Dlibunwind=false -Dplatforms=x11,drm,wayland,surfaceless -Dprefix=/usr build/ninja -C build/
sudo ninja -C build/ install
