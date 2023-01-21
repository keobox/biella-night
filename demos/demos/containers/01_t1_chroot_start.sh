#!/bin/bash

# Download rootfs
mkdir -p /var/tmp/alpine-rootfs/ && cd $_

curl https://dl-cdn.alpinelinux.org/alpine/v3.12/releases/x86_64/alpine-minirootfs-3.12.3-x86_64.tar.gz -o rootfs.tar.gz

read
tar xfz rootfs.tar.gz && rm -f rootfs.tar.gz

read
tree -L 1

# Create a chroot: changes root dir for the current process and children
read
sudo chroot /var/tmp/alpine-rootfs/ /bin/sh
