#!/usr/bin/env bash
# shellcheck disable=SC2034

if [ -n "$CI" ]; then
   IMGNAME="_ci-roller"
else
   IMGNAME="_homemade"
fi

iso_name="avdanos_$(date +%Y%m%d.%H%M).$(echo $RANDOM | md5sum | head -c 10; echo;)${IMGNAME}"
iso_label="ARCH_$(date +%Y%m)"
iso_publisher="AvdanOS GNU/Linux <https://archlinux.org>"
iso_application="AvdanOS GNU/Linux Live/Rescue CD"
iso_version="${GITHUB_REF_NAME}"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')