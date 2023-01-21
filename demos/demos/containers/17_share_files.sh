
# Are Containers immutable? Kind of...
# But is possible to inject read only files to chrooted processes

# Create a folder in the host system to host some read-only files
sudo mkdir -p /var/tmp/alpine-container-configs/
echo "Test" | sudo tee -a /var/tmp/alpine-container-configs/app-config
echo "Test2" | sudo tee -a /var/tmp/alpine-container-configs/srv-config

# Create a folder in the rootfs directory to use it as mount point
sudo mkdir -p /var/tmp/alpine-rootfs/etc/myconfigs

# Run a mount bind
sudo mount --bind -o ro /var/tmp/alpine-container-configs /var/tmp/alpine-rootfs/etc/myconfigs

# Run a chrooted shell
sudo unshare -p -f --mount-proc=/var/tmp/alpine-rootfs/proc chroot /var/tmp/alpine-rootfs/ /bin/sh

