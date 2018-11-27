#!/usr/bin/env bash
# Must be ROOT
# set threads to 3 as leaving one keeps tty and rdp session responsive.
set -eo pipefail
if [[ $EUID -ne 0 ]]; then
  echo "Please use SUDO to run this script"
  echo "Insufficinet privilages"
  exit 1
fi
echo "Disabling GUI Boot"
systemctl set-default multi-user.target
echo "Installing Packages..."
echo "========================================"
echo ""
echo ""
apt-get install -y libsoapysdr-dev libi2c-dev libusb-1.0-0-dev git g++ cmake libsqlite3-dev libwxgtk3.0-dev freeglut3-dev libboost-all-dev swig gnuradio xrdp
mkdir -p limesdr
git clone --branch=stable https://github.com/myriadrf/LimeSuite.git ./limesdr/limesuite-stable
git clone https://github.com/myriadrf/gr-limesdr ./limesdr/gr-limesdr

mkdir -p ./limesdr/limesuite-stable/build
mkdir -p ./limesdr/gr-limesdr/build

echo "Building & Installing LimeSDR GNU Radio"
echo "========================================"
echo ""
echo ""
(
  cd ./limesdr/gr-limesdr/build
  cmake ../
  make -j3
  make install
  ldconfig
)

echo "Building & Installing LimeSuite"
echo "========================================"
echo ""
echo ""
(
  cd ./limesdr/limesuite-stable/build
  cmake ../
  make -j3
  make install
  ldconfig
)

echo "Setting up udev Rules"
echo "========================================"
echo ""
echo ""
(
  cd ./limesdr/limesuite-stable/udev-rules
  bash install.sh
)

echo "Setting Ownership of Folders to $USER"
echo "========================================"
echo ""
echo ""

chown -R -c "$USER" ./limesdr

echo "========================================"
echo ""
echo ""
echo "Done!"
