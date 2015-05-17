SPK_NAME = glusterfs
SPK_VERS = 3.5.3
SPK_REV = 1
SPK_ICON = src/gluster.png
DSM_UI_DIR = app

DEPENDS = cross/zlib cross/openssl cross/busybox cross/$(SPK_NAME)

MAINTAINER = SynoCommunity
DESCRIPTION = GlusterFS is a unified, poly-protocol, scale-out filesystem serving many petabytes of data.
DISPLAY_NAME = GlusterFS

HOMEPAGE = https://www.gluster.org/
LICENSE  = AGPL

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
FWPORTS          = src/${SPK_NAME}.sc

INSTALL_PREFIX = /var/packages/$(SPK_NAME)/target

POST_STRIP_TARGET = glusterfs_extra_install

BUSYBOX_CONFIG = usrmng
ENV += BUSYBOX_CONFIG="$(BUSYBOX_CONFIG)"

include ../../mk/spksrc.spk.mk

.PHONY: glusterfs_extra_install
glusterfs_extra_install:
	install -m 755 -d $(STAGING_DIR)/var
	install -m 755 -d $(STAGING_DIR)/var/log
	install -m 755 -d $(STAGING_DIR)/var/log/glusterfs
	install -m 755 -d $(STAGING_DIR)/var/lib
	install -m 755 -d $(STAGING_DIR)/var/lib/glusterd
	install -m 755 -d $(STAGING_DIR)/var/run
	install -m 755 -d $(STAGING_DIR)/app
	install -m 755 -d $(STAGING_DIR)/app/images
	for size in 16 24 32 48 72 ; \
	do \
	    convert $(SPK_ICON) -thumbnail $${size}x$${size} \
	            $(STAGING_DIR)/app/images/$(SPK_NAME)-$${size}.png ; \
	done

