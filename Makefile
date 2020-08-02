INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = IconBundleID
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = SpringBoardServices

include $(THEOS_MAKE_PATH)/tweak.mk
