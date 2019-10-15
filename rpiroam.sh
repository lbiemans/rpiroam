#! /bin/sh

# Check if we are root

if [ $(id -u) -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Get the keys for the Debian sid repository

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC

# Copy some files to the correct place

cp etc/apt/preferences /etc/apt/
cp etc/apt/sources.list.d/sid.list /etc/apt/sources.list.d/
cp -a /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf.bak
cp etc/wpa_supplicant/wpa_supplicant.conf·/etc/wpa_supplicant/

# Update your packagelist

apt clean && apt update
apt install -y -t sid wpasupplicant

# Let's edit the wpa_supplicant file

echo "Please change at least identity, anonymous_identity and password. Optionaly if you know the value also change ca_cert"

sleep 10

vi /etc/wpa_supplicant/wpa_supplicant.conf

# Now we should be done

echo "Please reboot your pi to see if it works now"
