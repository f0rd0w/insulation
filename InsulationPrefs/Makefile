TARGET := iphone:clang:latest:12.2

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = InsulationPrefs

InsulationPrefs_FILES = $(shell find Sources/InsulationPrefs -name '*.swift') $(shell find Sources/InsulationPrefsC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
InsulationPrefs_SWIFTFLAGS = -ISources/InsulationPrefsC/include
InsulationPrefs_INSTALL_PATH = /Library/PreferenceBundles
InsulationPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk


# For the whole project
ADDITIONAL_LDFLAGS = -lroothide

# Or per tweak/tool
TweakName_LDFLAGS = -lroothide

SWIFT_TOOLCHAIN = /usr/lib/llvm-14
export SWIFT_TOOLCHAIN