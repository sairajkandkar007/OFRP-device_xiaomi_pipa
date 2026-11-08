#!/bin/bash
# OrangeFox build vars: https://gitlab.com/OrangeFox/infrastructure/doc/-/blob/main/dev/build_vars.md

FDEVICE="pipa"

fox_get_target_device() {
    local src=""
    if [ -n "$ZSH_VERSION" ]; then src="${(%):-%x}"
    elif [ -n "$BASH_VERSION" ]; then src="${BASH_SOURCE[0]}"
    else src="$0"
    fi

    if echo "$src" | grep -q "$FDEVICE"; then FOX_BUILD_DEVICE="$FDEVICE"
    elif [ -n "$BASH_VERSION" ] && set | grep BASH_ARGV | grep -q -w "$FDEVICE"; then FOX_BUILD_DEVICE="$FDEVICE"
    elif echo "$* $0" | grep -q -w "$FDEVICE"; then FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" ] && [ -z "$FOX_BUILD_DEVICE" ]; then
    fox_get_target_device "$@"
fi

if [ "$1" = "$FDEVICE" ] || [ "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export TARGET_DEVICE_ALT="pipa"

    # Binaries & tools
    export FOX_USE_BUSYBOX_BINARY=1
    export FOX_USE_BASH_SHELL=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_USE_ZSTD_BINARY=1
    export FOX_USE_LZ4_BINARY=1
    export FOX_USE_DATE_BINARY=1
    export FOX_USE_FSCK_EROFS_BINARY=1
    export FOX_USE_PATCHELF_BINARY=1
    export FOX_USE_GREP_BINARY=1
    export FOX_ASH_IS_BASH=1
    export FOX_BASH_TO_SYSTEM_BIN=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1

    # Settings / data locations
    export FOX_SETTINGS_ROOT_DIRECTORY="/data/recovery"
    export FOX_MISCELLANEOUS_ROOT_DIRECTORY="/sdcard"
    export FOX_ALLOW_EARLY_SETTINGS_LOAD=1

    # Addons
    export FOX_ENABLE_APP_MANAGER=1
    export FOX_DELETE_AROMAFM=1

    # A/B
    export FOX_VIRTUAL_AB_DEVICE=1
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

    export FOX_USE_UPDATED_MAGISKBOOT=1
    export LC_ALL="C"
fi
