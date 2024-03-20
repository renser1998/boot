#!/bin/bash
echo "===========Add module into initrd==========="

mkdir -p /usr/lib/dracut/modules.d/01test
cat << EOF >/usr/lib/dracut/modules.d/01test/module-setup.sh
#!/bin/bash

check() {
    return 0
}

depends() {
    return 0
}

install() {
    inst_hook cleanup 00 "\${moddir}/test.sh"
}
EOF
chmod +x /usr/lib/dracut/modules.d/01test/module-setup.sh



cat << EOF >/usr/lib/dracut/modules.d/01test/test.sh
#!/bin/bash

exec 0<>/dev/console 1<>/dev/console 2<>/dev/console
cat <<'msgend'
Hello! You are in dracut module!
 ___________________
< I am dracut module >
 -------------------
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /\'\_   _/\`\
    \\___)=(___/
msgend
sleep 10
echo " continuing...."

EOF
chmod +x /usr/lib/dracut/modules.d/01test/test.sh
echo "===========Rebuild initrd==========="
mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)
echo "===========Installed modules==========="
lsinitrd -m /boot/initramfs-$(uname -r).img | grep test