#!/system/bin/sh
# DRAFT, untested. Wi-Fi bring-up for pipa (QCA639x over PCIe, cnss2 built into the kernel).
# Stock loads qca_cld3_qca6390 / qca_cld3_qca6490 from /vendor/lib/modules; neither has module deps.
MODDIR=/vendor/lib/modules
LOG() { echo "$1:[WLAN] $2" >> /tmp/recovery.log; }

wait_wlan0() {
    i=0
    while [ $i -lt 15 ]; do
        [ -d /sys/class/net/wlan0 ] && return 0
        sleep 1
        i=$((i+1))
    done
    return 1
}

if [ -d /sys/class/net/wlan0 ]; then
    LOG I "wlan0 already present"
else
    for m in qca_cld3_qca6390 qca_cld3_qca6490; do
        if [ ! -f "$MODDIR/$m.ko" ]; then
            LOG E "missing $MODDIR/$m.ko"
            continue
        fi
        LOG I "insmod $m"
        insmod "$MODDIR/$m.ko" 2>> /tmp/recovery.log
        if wait_wlan0; then
            LOG I "wlan0 up via $m"
            break
        fi
        LOG E "no wlan0 after $m, unloading"
        rmmod wlan 2>> /tmp/recovery.log
    done
fi

resetprop twrp.wlan.drivers.loaded true
exit 0
