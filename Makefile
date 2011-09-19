include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = SpringVolume
SpringVolume_FILES = Tweak.xm
SpringVolume_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
