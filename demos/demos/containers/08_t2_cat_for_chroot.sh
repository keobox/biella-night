# See if our new chrooted shell thinks to be PID #1
ps -ef

# But we can see the whole network stack
ip -o a

# In Kubernetes containers will have different PID namespaces but they will share
# the Network Namespace
