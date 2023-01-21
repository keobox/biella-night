cat /etc/os-release

# Try to list /var/tmp/alpine-rootfs
ls /var/tmp/alpine-rootfs

# Install Python
echo "nameserver 8.8.8.8" > /etc/resolv.conf
apk add python3
python3 -m http.server

# Start http.server
python3 -m http.server
