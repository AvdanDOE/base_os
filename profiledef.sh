#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="avdanos_$(date +%Y%m%d.%H%M).$(echo $RANDOM | md5sum | head -c 10; echo;)_homemade-dogfood"
iso_label="ARCH_$(date +%Y%m)"
iso_publisher="AvdanOS GNU/Linux <https://archlinux.org>"
iso_application="AvdanOS GNU/Linux Live/Rescue CD"
iso_version="0.1"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)
