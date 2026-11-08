# OrangeFox build vars: https://gitlab.com/OrangeFox/infrastructure/doc/-/blob/main/dev/build_vars.md

# Screen (tune on device; README mentions side margins)
OF_SCREEN_H := 2880
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_CLOCK_POS := 1

# Quick backup
OF_QUICK_BACKUP_LIST := /boot;/persist_image;

# Security (disables MTP & ADB during password prompt)
OF_ADVANCED_SECURITY := 1

# Virtual A/B
OF_VAB_ORS_WIPE_DATA_IS_FORMAT := 1
OF_ENABLE_ALL_PARTITION_TOOLS := 1

# Wi-Fi in recovery
OF_ENABLE_WLAN := 1

# Add only if you hit the matching problem (carried from amethyst, unverified on pipa):
# OF_FORCE_DATA_FORMAT_F2FS := 1
# OF_FORCE_CASEFOLDING := 1
# OF_USE_LEGACY_TIME_FIXUP := 1
# OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
