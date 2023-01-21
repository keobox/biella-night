# Mount the /dev fs since we need to read data from urandom
mount -t devtmpfs dev /dev

# Create the python script
cat <<EOF > /opt/dumb.py
f = open("/dev/urandom", "r", encoding = "ISO-8859-1")
data = ""
i=0
while i < 20:
    data += f.read(10000000) # 10mb
    i += 1
    print("Used %d MB" % (i * 10))
EOF

