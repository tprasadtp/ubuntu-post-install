#!/usr/bin/env bash
# Apps, dpkg and ppas & Python modules are done by after-effects
# Disable GUI Boot.
# Set this to your Internal subnet or IP
# If you wish to allow from any ip set this to "any"
readonly ALLOWED_IP_RANGE="192.168.10.0/24"
echo "Disabling GUI Boot"
systemctl set-default multi-user.target
echo "Getting Pulse Audio Modules from GCS Bucket"
wget -q https://storage.googleapis.com/titus-software/XRDP-Pulseaudio-Modules/11.1/module-xrdp-sink.so \
    -o module-xrdp-sink.so
wget -q https://storage.googleapis.com/titus-software/XRDP-Pulseaudio-Modules/11.1/module-xrdp-source.so \
    -o module-xrdp-source.so
echo "Installing Pulse Audio Modules"
install -s -m 644 module-xrdp-sink.so /usr/lib/pulse-11.1/modules
install -s -m 644 module-xrdp-source.so /usr/lib/pulse-11.1/modules
echo "Symlinking them to be loaded by Pulse Audio Profile"
mkdir -p /var/lib/xrdp-pulseaudio-installer
ln -s /usr/lib/pulse-11.1/modules/module-xrdp-source.so \
      /var/lib/xrdp-pulseaudio-installer/module-xrdp-source.so
ln -s /usr/lib/pulse-11.1/modules/module-xrdp-sink.so \
      /var/lib/xrdp-pulseaudio-installer/module-xrdp-sink.so
echo "Setting up Firewall Rules"
# RDP TCP & UDP
ufw allow from "${ALLOWED_IP_RANGE}" to any port 3389 proto tcp
ufw allow from "${ALLOWED_IP_RANGE}" to any port 3389 proto udp
# SSH
ufw allow from "${ALLOWED_IP_RANGE}" to any port 22 proto tcp
# DHCP Server
ufw allow from "${ALLOWED_IP_RANGE}" to any port 67 proto tcp
ufw allow from "${ALLOWED_IP_RANGE}" to any port 67 proto udp
# Web Servers
ufw allow from "${ALLOWED_IP_RANGE}" to any port 80 proto tcp
ufw allow from "${ALLOWED_IP_RANGE}" to any port 443 proto tcp
# Jekyll & mkdocs
ufw allow from "${ALLOWED_IP_RANGE}" to any port 4000 proto tcp
ufw allow from "${ALLOWED_IP_RANGE}" to any port 8000 proto tcp
ufw default deny incoming
ufw default allow outgoing
echo "Enabling Firewall"
ufw enable
