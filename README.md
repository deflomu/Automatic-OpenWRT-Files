Automatic is an RSS downloader for Linux based systems, that grabs your favorite torrents based on filters you specify.

BUILD
=====

	$ scripts/feeds update -a
	$ scripts/feeds install automatic
	$ make tools/install
	$ make toolchain/install

Apply patch from http://patchwork.openwrt.org/patch/2351/ to feeds/packages/libs/pcre/Makefile.

	$ make package/automatic/{clean,compile,install} V=99 DEVELOPER=1

INSTALL
=======

Copy automatic_*_mipsel.ipk and libpcrecpp_*_mipsel.ipk from bin/packages/mipsel/ to the fon router and install both with opkg. Enable in /etc/config/automatic. Start with /etc/init.d/automatic start.
