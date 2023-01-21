
# Control groups allow the kernel to restrict resources like memory and CPU for specific processes.
# In this case we are going to create a new CGroup for our chrooted shell so it cannot use more
# than 200MB of RAM

ls /sys/fs/cgroup/

echo "Create a new cgroup. It's just a mkdir!"
echo "Hit return"
read

sudo mkdir /sys/fs/cgroup/alpinecgroup

echo "Cgroup populated"
ls /sys/fs/cgroup/alpinecgroup/

echo "Limit memory to 200 MB"
echo "Hit return"
read

# Set a limit of 200MB of RAM
echo "200000000" | sudo tee -a /sys/fs/cgroup/alpinecgroup/memory.max
# Disable swap
echo "0" | sudo tee -a /sys/fs/cgroup/alpinecgroup/memory.swap.max

echo "Assign this Cgroup to the chrooted shell"
echo "Hit return"
read

# Get the previous unshare PPID
UNSHARE_PPID=$(ps -ef | grep "sudo unshare" | grep chroot | awk '{print $2}')
# Get the previous unshare PID
UNSHARE_PID=$(ps -ef | grep ${UNSHARE_PPID} | grep chroot | grep -v sudo | awk '{print $2}')
# Get the previous chrooted shell PID
SHELL_PID=$(ps -ef | grep ${UNSHARE_PID} | grep -v chroot |  grep /bin/sh | awk '{print $2}')
# Assign the shell process to the cgroup
echo ${SHELL_PID} | sudo tee -a /sys/fs/cgroup/alpinecgroup/cgroup.procs

