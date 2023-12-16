#!/usr/bin/env sh

sudo pacman --noconfirm --needed -S zram-generator

echo '[zram0]
zram-size = ram / 2
compression-algorithm = zstd
swap-priority = 100
fs-type = swap' | sudo tee /etc/systemd/zram-generator.conf

sudo systemctl daemon-reload

sudo systemctl start /dev/zram0

echo "check with"
echo "swapon or zramctl or"
