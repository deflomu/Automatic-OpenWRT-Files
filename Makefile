include $(TOPDIR)/rules.mk

PKG_NAME:=automatic
PKG_VERSION:=0.8.0
PKG_RELEASE:=1
PKG_REV:=48325d6edaf09e2e64bd61dabfdb01e93f1a5fb5

PKG_BUILD_DIR:=$(BUILD_DIR)/automatic-$(PKG_VERSION)
PKG_SOURCE:=${PKG_NAME}-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://github.com/1100101/Automatic.git
PKG_SOURCE_VERSION:=${PKG_REV}
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
# Do not check mirrors for source
PKG_SOURCE_MIRROR=0

include $(INCLUDE_DIR)/package.mk

define Package/automatic
  SECTION:=base
  CATEGORY:=Network
  DEPENDS:=+libcurl +libxml2 +libpcrecpp
  TITLE:=A RSS torrent downloader
  URL:=http://kylek.is-a-geek.org:31337/Automatic/
endef

define Package/automatic/Description
  Automatic is an RSS downloader for Linux based systems, that grabs your favorite torrents based on filters you specify
endef

CONFIGURE_CMD =./autogen.sh

define Package/automatic/install
        $(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/automatic $(1)/usr/bin/
	$(CP) -r ./files/* $(1)/
endef

$(eval $(call BuildPackage,automatic))
