include $(TOPDIR)/rules.mk

PKG_NAME:=automatic
PKG_VERSION:=0.6.4
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/automatic-$(PKG_VERSION)
PKG_SOURCE:=automatic-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://kylek.is-a-geek.org:31337/files/
PKG_MD5SUM:=e28b162a3f5486a961277bd1846466d8
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/automatic
  SECTION:=base
  CATEGORY:=Network
  DEFAULT:=n
  TITLE:=automatic rss torrent downloader
  DESCRIPTION:=Automatic is an RSS downloader for Linux based systems, that grabs your favorite torrents based on filters you specify.
  URL:=http://kylek.is-a-geek.org:31337/Automatic/
endef

define Package/automatic/install
        install -m0755 -d $(1)/usr/sbin
        install -m0755 $(PKG_BUILD_DIR)/ $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,automatic))
