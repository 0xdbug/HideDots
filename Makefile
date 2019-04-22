ARCHS = arm64 arm64e

export THEOS_DEVICE_IP = localhost
export THEOS_DEVICE_PORT = 2222


include ../theos/makefiles/common.mk


TWEAK_NAME = HideDots
HideDots_FILES = Tweak.xm
HideDots_EXTRA_FRAMEWORKS += Cephei




include ../theos/makefiles/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += hidedotspref
include ../theos/makefiles/aggregate.mk
