#######################################################################
#			LDD.mk
#####################################################################


LDD_VERSION = dba92f9da55ad6faf1960c068b10065d95f37ecb
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-sijeo-philip.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES


# This Variable tells Build root which subdirectories to descend int

LDD_MODULE_SUBDIRS += misc-modules
LDD_MODULE_SUBDIRS += scull

LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
endef


# The following is an example of how Buildroot's kmod mechanismm mightbe used if your modules are 
# built using a common Makefile pattern
	
$(eval $(generic-package))
$(eval $(kernel-module))

