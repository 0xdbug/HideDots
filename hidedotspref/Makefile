ARCHS = arm64 arm64e

include ../../../theos/makefiles/common.mk

BUNDLE_NAME = hidedotspref
hidedotspref_FILES = pRootListController.m
hidedotspref_INSTALL_PATH = /Library/PreferenceBundles
hidedotspref_FRAMEWORKS = UIKit
hidedotspref_PRIVATE_FRAMEWORKS = Preferences
hidedotspref_EXTRA_FRAMEWORKS += CepheiPrefs




include ../../../theos/makefiles/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/hidedotspref.plist$(ECHO_END)
