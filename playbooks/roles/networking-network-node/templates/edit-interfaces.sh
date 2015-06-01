#!/bin/bash

cat-iface-eth3() {
        cat <<EOF
auto eth3
iface eth3 inet manual
        up ip link set dev \$IFACE up
        down ip link set dev \$IFACE down
EOF
}

# Get the number of the line that includes iface eth3
lineno=$(ed -s /etc/network/interfaces 2> /dev/null <<EOF | tail -1 | awk '{print $1}'
/^auto eth3
n
EOF
)

if [ -z "$lineno" ]; then
        cat-iface-eth3 >> /etc/network/interfaces
        exit
fi

# Test next interface exists
if ed -s /etc/network/interfaces 2> /dev/null <<EOF | grep -q ^auto
$((lineno + 1)),\$p
EOF
then
        # Delete lines until the next interface if it exists
        ed -s /etc/network/interfaces 2> /dev/null <<EOF
$lineno
/^auto
-
$((lineno)),.d
i
$(cat-iface-eth3)
.
w
EOF
else
        # Delete lines until EOF if it doesn't exist
        ed -s /etc/network/interfaces 2> /dev/null <<EOF
$lineno
.,\$d
a
$(cat-iface-eth3)
.
w
EOF
fi
