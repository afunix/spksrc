PKG_NAME = glusterfs
PKG_VERS = 3.5.3
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://download.gluster.org/pub/gluster/glusterfs/3.5/3.5.3/
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/openssl

HOMEPAGE = https://www.gluster.org/
COMMENT  = GlusterFS is a unified, poly-protocol, scale-out filesystem serving many petabytes of data.
LICENSE  = AGPL

GNU_CONFIGURE = 1
CONFIGURE_ARGS = 

INSTALL_PREFIX = /var/packages/glusterfs/target
INSTALL_TARGET = glusterfs_install_target

include ../../mk/spksrc.cross-cc.mk


glusterfs_install_target:
	$(RUN) $(MAKE) install prefix=$(STAGING_INSTALL_PREFIX) mountutildir=$(STAGING_INSTALL_PREFIX)/sbin utildir=$(STAGING_INSTALL_PREFIX)/sbin initdir=$(STAGING_INSTALL_PREFIX)/etc/init.d initdir=$(STAGING_INSTALL_PREFIX)/etc/init.d INIT_DIR=$(STAGING_INSTALL_PREFIX)/etc/init.d 


