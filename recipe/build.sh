# We are going to disable some tests on qemu based platforms

if [ ${target_platform} == linux-aarch64 ]; then
   sed -i '/get_currentexe/d' ./test/test-list.h
   sed -i '/udp_multicast_interface/d' ./test/test-list.h
   sed -i '/udp_no_autobind/d' ./test/test-list.h
fi

# LIBTOOLIZE setting is required to workaround missing glibtoolize on OS X:
# https://github.com/joyent/libuv/issues/1200
LIBTOOLIZE=libtoolize sh ./autogen.sh

./configure \
   --disable-dependency-tracking \
   --disable-silent-rules \
   --prefix="$PREFIX" \

make
make check
make install
