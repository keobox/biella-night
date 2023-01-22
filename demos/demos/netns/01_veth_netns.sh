
echo "Create 2 net namespaces"
echo "Hit return when I stop"
read
sudo ip netns add red
sudo ip netns add blue
sudo ip netns

echo "Create a virtual cable"
read
sudo ip link add veth-red type veth peer name veth-blue
sudo ip link

echo "Assign the cable endpoints to 2 namespaces"
echo "The cable interface are virtual network interfaces"
read
sudo ip link set veth-red netns red
sudo ip link set veth-blue netns blue

echo "Links are moved out the global netns"
read
sudo ip link
sudo ip -n red link
sudo ip -n blue link

echo "Assign IP addresses to interfaces"
read
sudo ip -n red addr add 192.168.15.1 dev veth-red
sudo ip -n red addr add 192.168.15.2 dev veth-blue

echo "Bring up intefaces"
read
sudo ip -n red link set veth-red up
sudo ip -n blue link set veth-blue up
