#!/bin/bash
echo "===========check vgs==========="
vgs
echo "===========rename vg==========="
vgrename VolGroup00 OtusRoot
echo "===========replace vg==========="
sed -i 's/VolGroup00/OtusRoot/g' /etc/default/grub && sed -i 's/VolGroup00/OtusRoot/g' /boot/grub2/grub.cfg && sed -i 's/VolGroup00/OtusRoot/g' /etc/fstab
echo "===========regenerate initramfs==========="
mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)
echo "===========please, reboot system==========="