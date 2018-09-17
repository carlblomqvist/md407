#!/bin/bash

echo "Make sure your last connected device was the MD407 and press any key to continue"
read -n 1

# Get last connected device
PORT=$(dmesg | tail -1 | grep -oE '[^ ]+$')

if [ $PORT != "disconnected" ]
then
  # Get the owner group of the /dev devices
  group="$(ls -alh /dev/$PORT | cut -d " " -f 4)"
  # Add the current user to that group
  sudo usermod -a -G $group $(whoami)
else
  echo "Can't detect MD407, exiting with no changes made."
  exit
fi

sudo cp bin/setMD407baud /usr/local/bin/setMD407baud
sudo chmod +x /usr/local/bin/setMD407baud

sudo cp bin/md407 /usr/local/bin/md407
sudo chmod +x /usr/local/bin/md407

sudo cp bin/10-md407.rules /etc/udev/rules.d/10-md407.rules

sudo udevadm control --reload-rules

echo "All done!
Use the command \"md407 -h\" to see instructions on how to load files to the MD407
If you can't run it, you need to add /usr/local/bin to your PATH."
