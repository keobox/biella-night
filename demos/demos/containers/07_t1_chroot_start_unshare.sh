
sudo unshare -p -f --mount-proc=/var/tmp/alpine-rootfs/proc chroot /var/tmp/alpine-rootfs/ /bin/sh
