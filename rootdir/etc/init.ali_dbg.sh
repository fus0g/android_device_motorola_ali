#!/system/bin/sh
# Kernel bring-up helper: dump USB/gadget state to /cache so it can be read
# from recovery while adb over USB is not working. Debug only.
O=/cache/ali_dbg
mkdir -p $O
chmod 0777 $O

dump_state() {
    {
        echo "== date: $(date)  uptime: $(cat /proc/uptime)"
        echo "== getenforce: $(getenforce)"
        echo "== usb/adb properties"
        getprop | grep -i -E "usb|adb"
        echo "== /config"
        mount | grep -i -E "config|ffs"
        ls -la /config /config/usb_gadget 2>&1
        ls -la /config/usb_gadget/g1 2>&1
        echo "UDC=[$(cat /config/usb_gadget/g1/UDC 2>&1)]"
        ls -laR /config/usb_gadget/g1/configs /config/usb_gadget/g1/functions /config/usb_gadget/g1/strings 2>&1 | head -120
        echo "== udc"
        ls -la /sys/class/udc 2>&1
        for u in /sys/class/udc/*; do echo "$u state=$(cat $u/state 2>&1) speed=$(cat $u/current_speed 2>&1)"; done
        echo "== usb-ffs"
        ls -la /dev/usb-ffs /dev/usb-ffs/adb 2>&1
        echo "== processes"
        ps -A | grep -i -E "adbd|usb"
        echo "== power_supply"
        for p in /sys/class/power_supply/*; do echo "$p type=$(cat $p/type 2>&1) online=$(cat $p/online 2>&1) present=$(cat $p/present 2>&1)"; done
        echo "== extcon"
        ls -la /sys/class/extcon 2>&1
        for e in /sys/class/extcon/*; do echo "$e name=$(cat $e/name 2>&1) state=$(cat $e/state 2>&1)"; done
        echo "== dwc3/usb devices"
        ls /sys/bus/platform/devices | grep -i -E "usb|dwc3|ssusb"
        for d in /sys/devices/platform/soc/7000000.ssusb /sys/devices/platform/soc/7000000.ssusb/7000000.dwc3; do ls $d 2>&1 | head -30; done
    } > $1 2>&1
}

sleep 25
dump_state $O/state1.txt

getprop > $O/props.txt 2>&1
dmesg > $O/dmesg.txt 2>&1
logcat -d -b all > $O/logcat.txt 2>&1
sync
echo done > $O/done
