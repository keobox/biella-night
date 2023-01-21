# Mount the /proc filesystem into the chrooted process
mount -t proc proc /proc

ps -ef | grep "ping 127.0.0.1"

# We have visibility of the not chrooted pring process
# pkill -f "ping 127.0.0.0.1"

# In containers processes are isolated instead, how this can be done?
