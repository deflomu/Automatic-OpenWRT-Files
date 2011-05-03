include $(TOPDIR)/rules.mk

PKG_NAME:=automatic
PKG_VERSION:=0.6.5
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/automatic-$(PKG_VERSION)
PKG_SOURCE:=automatic-$(PKG_VERSION)-src.tar.gz
PKG_SOURCE_URL:=http://kylek.is-a-geek.org:31337/files/
PKG_MD5SUM:=1eee82d41add88d9f49c0491b36fec20
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/automatic
  SECTION:=base
  CATEGORY:=Network
  DEPENDS:=+libcurl +libxml2 +libpcre
  TITLE:=A RSS torrent downloader
  URL:=http://kylek.is-a-geek.org:31337/Automatic/
endef

define Package/automatic/Description
  Automatic is an RSS downloader for Linux based systems, that grabs your favorite torrents based on filters you specify
endef

define Package/automatic/install
        $(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/automatic $(1)/usr/bin/
	$(CP) -r ./files/* $(1)/
endef

$(eval $(call BuildPackage,automatic))
