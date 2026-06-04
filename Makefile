export THEOS_DEVICE_IP = localhost
export THEOS_DEVICE_PORT = 2222

INSTALL_TARGET_PROCESSES = thermalmonitord

ifeq ($(THEOS_PACKAGE_SCHEME), rootless)
TARGET = iphone:clang:latest:16.5
else ifeq ($(THEOS_PACKAGE_SCHEME),roothide)
TARGET = iphone:clang:latest:16.5
else
TARGET = iphone:clang:latest:16.5
endif

ARCHS = arm64 arm64e
DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = insulation

$(TWEAK_NAME)_USE_MODULES = 0

$(TWEAK_NAME)_FILES = $(shell find Sources/$(TWEAK_NAME) -name '*.swift') \
$(shell find Sources/$(TWEAK_NAME)C -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')

$(TWEAK_NAME)_SWIFTFLAGS = -ISources/$(TWEAK_NAME)C/include
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -ISources/$(TWEAK_NAME)C/include -fno-objc-msgsend-selector-stubs
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = IOKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += InsulationPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk

# For the whole project
ADDITIONAL_LDFLAGS = -lroothide

# Or per tweak/tool
TweakName_LDFLAGS = -lroothide


SWIFT_TOOLCHAIN = /usr/lib/llvm-14
export SWIFT_TOOLCHAIN